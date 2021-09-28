import 'package:flutter/material.dart';
import 'package:transform_example/pages/list/model/character.dart';
import 'package:transform_example/pages/transitions/example1/transitions1_details.dart';

class Transitions1Page extends StatefulWidget {
  const Transitions1Page({Key? key}) : super(key: key);

  @override
  State<Transitions1Page> createState() => _Transitions1PageState();
}

class _Transitions1PageState extends State<Transitions1Page> {
  List<Character>? _characters;
  bool _isListMode = true;

  // Simula o carregamento demorado da lista de personagens
  Future<void> _loadCharactersData() async {
    await Future.delayed(
      const Duration(seconds: 3),
    ).then((_) {
      setState(() {
        _characters = characters;
      });
    });
  }

  @override
  void initState() {
    _loadCharactersData();
    super.initState();
  }

  Widget _getBodWidget() {
    if (_isListMode) {
      return HomeListView(charactersCollection: _characters!);
    }
    return HomeGridView(charactersCollection: _characters!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Transitions'),
        actions: [
          IconButton(
            icon: Icon(_isListMode
                ? Icons.view_list_rounded
                : Icons.grid_view_rounded),
            onPressed: () {
              setState(() {
                _isListMode = !_isListMode;
              });
            },
          ),
        ],
      ),
      body: _characters != null
          ? _getBodWidget()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class HomeListView extends StatelessWidget {
  final List<Character> charactersCollection;
  const HomeListView({
    Key? key,
    required this.charactersCollection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: charactersCollection.length,
      itemExtent: 200,
      itemBuilder: (context, index) =>
          HomeItem(character: charactersCollection[index]),
    );
  }
}

class HomeGridView extends StatelessWidget {
  final List<Character> charactersCollection;

  const HomeGridView({Key? key, required this.charactersCollection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: charactersCollection.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return HomeItem(character: charactersCollection[index]);
      },
    );
  }
}

class HomeItem extends StatelessWidget {
  final Character character;
  const HomeItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Transitions1Details(character: character),
          ),
        );
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: .65,
              child: Image.network(
                character.avatar,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  return loadingProgress == null
                      ? child
                      : const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 0,
            child: Text(
              character.title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 15,
                    offset: Offset(5, 2),
                    spreadRadius: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

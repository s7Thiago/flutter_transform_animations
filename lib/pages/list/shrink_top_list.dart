import 'package:flutter/material.dart';
import 'package:transform_example/pages/list/model/character.dart';

const itemSize = 150.0;

class ShrinkTopList extends StatefulWidget {
  const ShrinkTopList({Key? key}) : super(key: key);

  @override
  State<ShrinkTopList> createState() => _ShrinkTopListState();
}

class _ShrinkTopListState extends State<ShrinkTopList> {
  final scrollController = ScrollController();

  void onListen() {}

  @override
  void initState() {
    scrollController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shrink top list'),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverList(
            // ! Este delegate será usando porque serve para construir os itens dinamicamente
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final character = characters[index];
                return Card(
                  color: Color(character.color),
                  child: SizedBox(
                    height: itemSize,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              character.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        Image.network(character.avatar),
                      ],
                    ),
                  ),
                );
              },
              childCount: characters.length,
            ),
          )
        ],
      ),
    );
  }
}

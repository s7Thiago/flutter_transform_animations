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

  void onListen() {
    setState(() {});
  }

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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverList(
              // ! Este delegate será usando porque serve para construir os itens dinamicamente
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final character = characters[index];

                  final itemPositionOffset = index * itemSize;
                  final difference =
                      scrollController.offset - itemPositionOffset;
                  final percent = 1 - (difference / itemSize);
                  double opacity = percent.clamp(0.0, 1.0);

                  return Opacity(
                    opacity: opacity,
                    child: Transform(
                      transform: Matrix4.identity()..scale(percent, 1.0),
                      child: Card(
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
                      ),
                    ),
                  );
                },
                childCount: characters.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

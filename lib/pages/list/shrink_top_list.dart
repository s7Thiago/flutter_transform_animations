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
            const SliverToBoxAdapter(
              child: Placeholder(
                fallbackHeight: 100.0,
              ),
            ),
            const SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                'Shrink top list',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),

            // ? Adicionando espaçamento
            const SliverToBoxAdapter(child: SizedBox(height: 50)),

            SliverList(
              // ! Este delegate será usando porque serve para construir os itens dinamicamente
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final character = characters[index];

                  final itemPositionOffset = index * itemSize / 2;
                  final difference =
                      scrollController.offset - itemPositionOffset;
                  final percent = 1 - (difference / (itemSize / 2));
                  double opacity = percent.clamp(0.0, 1.0);
                  double scale = percent.clamp(0.0, 1.0);

                  return Align(
                    heightFactor: .5,
                    child: Opacity(
                      opacity: opacity,
                      child: Transform(
                        alignment: Alignment.topCenter,
                        transform: Matrix4.identity()
                          // ..setEntry(3, 2, 0.001)
                          ..scale(scale, 1),
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          )),
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
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(
                                      20.0,
                                    ),
                                  ),
                                  child: Image.network(character.avatar),
                                ),
                              ],
                            ),
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

class MyCustomHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // return Padding(
    // padding: const EdgeInsets.symmetric(horizontal: 20.0),
    // child: ListView(
    //   scrollDirection: Axis.horizontal,
    //   children: List.generate(
    //     6,
    //     (index) => Container(
    //       width: 300,
    //       height: 300,
    //       color: Colors.deepPurple,
    //       margin: const EdgeInsets.all(5.0),
    //     ),
    //   ),
    // )
    // );
    return const Text('My Characters');
  }

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 0.0;

  @override
  bool shouldRebuild(covariant MyCustomHeader oldDelegate) {
    return true;
  }
}

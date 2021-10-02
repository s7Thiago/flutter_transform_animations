import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AndroidMessagesAnimation extends StatefulWidget {
  const AndroidMessagesAnimation({Key? key}) : super(key: key);

  @override
  State<AndroidMessagesAnimation> createState() =>
      _AndroidMessagesAnimationState();
}

class _AndroidMessagesAnimationState extends State<AndroidMessagesAnimation> {
  bool expanded = true;
  final _scrollController = ScrollController();

  _onScrollDirection() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        expanded = false;
      });
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        expanded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Android messages animation'),
        // ),
        floatingActionButton: _AndroidMessagesFAB(
          expanded: expanded,
          onTap: () {
            setState(() {
              expanded = !expanded;
            });
          },
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: const [
                    SizedBox(width: 10),
                    Icon(Icons.search),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(13.0),
                        child: Text('Search conversations'),
                      ),
                    ),
                    Icon(Icons.more_vert_outlined),
                  ],
                ),
              ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (details) {
                    _onScrollDirection();
                    return true;
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: 35,
                    itemBuilder: (context, index) {
                      return _AndroidMessageItem(
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AndroidMessageItem extends StatelessWidget {
  final Color color;
  const _AndroidMessageItem({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: const Icon(
          Icons.person,
          color: Colors.black87,
        ),
      ),
      title: const Text('515'),
      subtitle: const Text('Hey! What\'s up?'),
      trailing: const Text('30 min'),
    );
  }
}

const _duration = Duration(milliseconds: 400);
const _minSize = 50.0;
const _maxSize = 150.0;
const _iconSize = 25.0;

class _AndroidMessagesFAB extends StatelessWidget {
  final bool expanded;
  final VoidCallback? onTap;

  const _AndroidMessagesFAB({
    Key? key,
    this.expanded = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const position = _minSize / 2 - _iconSize / 2;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        curve: Curves.easeInOutQuart,
        duration: _duration,
        width: expanded ? _maxSize : _minSize,
        height: _minSize,
        decoration: BoxDecoration(
            color: Colors.blue[800],
            borderRadius: BorderRadius.circular(_minSize * .5),
            boxShadow: [
              BoxShadow(
                color: expanded ? Colors.black45 : Colors.black12,
                offset: const Offset(0, 0),
                blurRadius: 5,
                spreadRadius: 2,
              )
            ]),
        child: Stack(
          children: const [
            Positioned(
              left: position,
              top: position,
              child: Icon(Icons.message),
            ),
            Positioned(
              left: position + 1.5 * _iconSize,
              top: position + 2,
              child: Text(
                'Start chat',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

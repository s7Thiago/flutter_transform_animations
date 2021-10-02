import 'package:flutter/material.dart';

class AndroidMessagesAnimation extends StatelessWidget {
  const AndroidMessagesAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Android messages animation'),
        // ),
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
                child: ListView.builder(
                  itemCount: 35,
                  itemBuilder: (context, index) {
                    return _AndroidMessageItem(
                        color:
                            Colors.primaries[index % Colors.primaries.length]);
                  },
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

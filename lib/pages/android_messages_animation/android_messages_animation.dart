import 'package:flutter/material.dart';

class AndroidMessagesAnimation extends StatelessWidget {
  const AndroidMessagesAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Android messages animation'),
        ),
        body: ListView.builder(
          itemCount: 25,
          itemBuilder: (context, index) {
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

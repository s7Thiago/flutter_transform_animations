import 'package:flutter/material.dart';
import 'package:transform_example/pages/list/model/character.dart';

class Transitions1Details extends StatelessWidget {
  final Character character;
  const Transitions1Details({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Container(),
    );
  }
}

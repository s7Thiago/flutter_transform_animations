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
        title: Text('Details: $character.title'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.network(
              character.avatar,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '${character.description} ${character.description} ${character.description} ${character.description}',
                textAlign: TextAlign.justify,
              ),
            ),
          )
        ],
      ),
    );
  }
}

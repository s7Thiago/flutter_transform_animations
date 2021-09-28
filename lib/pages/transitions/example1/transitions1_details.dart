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
        title: Text('Details: ${character.title}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Hero(
              tag: character.title,
              child: Image.network(
                character.avatar,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 1.0, end: 0.0),
                curve: Curves.bounceOut,
                duration: const Duration(milliseconds: 1200),
                child: Text(
                  '${character.description} ${character.description} ${character.description} ${character.description}',
                  textAlign: TextAlign.justify,
                ),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(value * 250, 0.0),
                    child: child!,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

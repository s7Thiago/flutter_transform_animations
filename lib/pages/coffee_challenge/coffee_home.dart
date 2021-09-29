import 'package:flutter/material.dart';
import 'package:transform_example/pages/coffee_challenge/coffee_list.dart';
import 'package:transform_example/pages/coffee_challenge/model/coffee.dart';

class CoffeeHome extends StatelessWidget {
  const CoffeeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! < -20) {
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 800),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: const CoffeeList(),
                  );
                },
              ),
            );
          }
        },
        child: Stack(
          children: [
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFA89276),
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              height: size.height * 0.4,
              left: 0,
              right: 0,
              top: size.height * 0.15,
              child: Hero(
                tag: coffees[6].name,
                child: Image.asset(coffees[6].image),
              ),
            ),
            Positioned(
              height: size.height * 0.7,
              left: 0,
              right: 0,
              bottom: 0,
              child: Hero(
                tag: coffees[7].name,
                child: Image.asset(
                  coffees[7].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              height: size.height,
              left: 0,
              right: 0,
              bottom: -size.height * 0.8,
              child: Hero(
                tag: coffees[8].name,
                child: Image.asset(
                  coffees[8].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              height: 140,
              left: 0,
              right: 0,
              bottom: size.height * 0.25,
              child: Image.asset('assets/images/coffee/logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}

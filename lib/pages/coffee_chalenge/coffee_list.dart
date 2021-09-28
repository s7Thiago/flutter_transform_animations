import 'package:flutter/material.dart';
import 'package:transform_example/pages/coffee_chalenge/model/coffee.dart';

class CoffeeList extends StatefulWidget {
  const CoffeeList({Key? key}) : super(key: key);

  @override
  State<CoffeeList> createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  late final _pageController;

  double _currentPage = 0.0;

  void _coffeeScrollListener() {
    setState(() {
      _currentPage = _pageController.page;
    });
  }

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: .35, // * Apenas 3 itens serão visíveis
    );
    _pageController.addListener(_coffeeScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_coffeeScrollListener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            bottom: -size.height * .2,
            height: size.height * .3,
            child: const DecoratedBox(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.brown,
                  blurRadius: 90,
                  offset: Offset.zero,
                )
              ]),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: 100,
            child: Container(
              color: Colors.red,
            ),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: coffees.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const SizedBox.shrink();
              }

              final coffee = coffees[index - 1];
              final result = _currentPage - index + 1;

              // Valor que será usado para aplicar na transformação das imagens dos cafés
              final value = -.4 * result + 1;

              final opacity = value.clamp(0.0, 1.0);

              return Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translate(
                      0.0,
                      MediaQuery.of(context).size.height /
                          2.6 *
                          (1 - value).abs())
                  ..scale(value),
                child:
                    Opacity(opacity: opacity, child: Image.asset(coffee.image)),
              );
            },
          )
        ],
      ),
    );
  }
}
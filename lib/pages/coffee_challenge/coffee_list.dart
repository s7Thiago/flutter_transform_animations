import 'package:flutter/material.dart';
import 'package:transform_example/pages/coffee_challenge/model/coffee.dart';

const _duration = Duration(milliseconds: 300);

class CoffeeList extends StatefulWidget {
  const CoffeeList({Key? key}) : super(key: key);

  @override
  State<CoffeeList> createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  late final PageController _pageController;
  late final PageController _pageTextController;

  double _currentPage = 0.0;
  double _textPage = 0.0;

  void _coffeeScrollListener() {
    setState(() {
      _currentPage = _pageController.page!;
    });
  }

  void _textScrollListener() {
    setState(() {
      _textPage = _pageController.page!;
    });
  }

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: .35, // * Apenas 3 itens serão visíveis
    );

    _pageTextController = PageController();

    _pageController.addListener(_coffeeScrollListener);
    _pageTextController.addListener(_textScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_coffeeScrollListener);
    _pageController.dispose();

    _pageTextController.removeListener(_textScrollListener);
    _pageTextController.dispose();
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
            bottom: -size.height * .22,
            height: size.height * .3,
            child: const DecoratedBox(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.brown,
                  blurRadius: 90,
                  offset: Offset.zero,
                  spreadRadius: 45,
                )
              ]),
            ),
          ),
          Transform.scale(
            scale: 1.6,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
              controller: _pageController,
              itemCount: coffees.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              onPageChanged: (value) {
                if (value < coffees.length) {
                  _pageTextController.animateToPage(
                    value,
                    duration: _duration,
                    curve: Curves.easeInOutQuad,
                  );
                }
              },
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const SizedBox.shrink();
                }

                final coffee = coffees[index - 1];
                final result = _currentPage - index + 1;

                // Valor que será usado para aplicar na transformação das imagens dos cafés
                final value = -.4 * result + 1;

                final opacity = value.clamp(0.0, 1.0);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..translate(0.0, size.height / 2.6 * (1 - value).abs())
                      ..scale(value),
                    child: Opacity(
                      opacity: opacity,
                      child: Hero(
                        tag: coffee.name,
                        child: Image.asset(coffee.image, fit: BoxFit.fitHeight),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: 100,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: coffees.length,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageTextController,
                    itemBuilder: (context, index) {
                      final opacity =
                          1 - (index - _textPage).abs().clamp(0.0, 1.0);
                      return Opacity(
                        opacity: opacity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * .35,
                          ),
                          child: Text(
                            coffees[index].name,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                AnimatedSwitcher(
                  duration: _duration,
                  child: Text(
                    '\$${coffees[_currentPage.toInt()].price.toStringAsFixed(2)}',
                    key: Key(coffees[_currentPage.toInt()].name),
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

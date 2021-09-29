import 'package:flutter/material.dart';
import 'package:transform_example/pages/coffee_challenge/coffee_bloc.dart';
import 'package:transform_example/pages/coffee_challenge/coffee_details_page.dart';
import 'package:transform_example/pages/coffee_challenge/model/coffee.dart';

const _duration = Duration(milliseconds: 300);

class CoffeeList extends StatefulWidget {
  const CoffeeList({Key? key}) : super(key: key);

  @override
  State<CoffeeList> createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = CoffeeProvider.of(context)!.coffeeBloc;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.grey),
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
          ValueListenableBuilder<double>(
            valueListenable: bloc.currentPage,
            builder: (context, currentPage, _) {
              return Transform.scale(
                scale: 1.6,
                alignment: Alignment.bottomCenter,
                child: PageView.builder(
                  controller: bloc.pageController,
                  itemCount: coffees.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  onPageChanged: (value) {
                    if (value < coffees.length) {
                      bloc.pageTextController.animateToPage(
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
                    final result = currentPage - index + 1;

                    // Valor que será usado para aplicar na transformação das imagens dos cafés
                    final value = -.4 * result + 1;

                    final opacity = value.clamp(0.0, 1.0);

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 650),
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return FadeTransition(
                                opacity: animation,
                                child: CoffeeDetailsPage(coffee: coffee),
                              );
                            },
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..translate(
                                0.0, size.height / 2.6 * (1 - value).abs())
                            ..scale(value),
                          child: Opacity(
                            opacity: opacity,
                            child: Hero(
                              tag: 'image_${coffee.image}',
                              child: Image.asset(coffee.image,
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: 100,
            child: _CoffeeHeader(),
          ),
        ],
      ),
    );
  }
}

class _CoffeeHeader extends StatelessWidget {
  const _CoffeeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = CoffeeProvider.of(context)!.coffeeBloc;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 1.0, end: 0.0),
      duration: _duration,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0.0, -100 * value),
          child: child,
        );
      },
      child: ValueListenableBuilder<double>(
          valueListenable: bloc.textPage,
          builder: (context, textPage, _) {
            return Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: coffees.length,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: bloc.pageTextController,
                    itemBuilder: (context, index) {
                      final opacity =
                          1 - (index - textPage).abs().clamp(0.0, 1.0);
                      return Opacity(
                        opacity: opacity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * .35,
                          ),
                          child: Hero(
                            tag: 'text_${coffees[index].name}',
                            child: Material(
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
                    '\$${coffees[textPage.toInt()].price.toStringAsFixed(2)}',
                    key: Key(coffees[textPage.toInt()].name),
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';

const _initialPage = 8.0;

class CoffeeBloc {
  final PageController pageController = PageController(
    viewportFraction: .35, // * Apenas 3 itens serão visíveis
    initialPage: _initialPage.toInt(),
  );
  final PageController pageTextController = PageController(
    initialPage: _initialPage.toInt(),
  );

  final currentPage = ValueNotifier<double>(_initialPage);
  final textPage = ValueNotifier<double>(_initialPage);

  void _coffeeScrollListener() {
    currentPage.value = pageController.page!;
  }

  void _textScrollListener() {
    textPage.value = pageController.page!;
  }

  void init() {
    currentPage.value = _initialPage;
    textPage.value = _initialPage;
    pageController.addListener(_coffeeScrollListener);
    pageTextController.addListener(_textScrollListener);
  }

  void dispose() {
    pageController.removeListener(_coffeeScrollListener);
    pageController.dispose();

    pageTextController.removeListener(_textScrollListener);
    pageTextController.dispose();
  }
}

class CoffeeProvider extends InheritedWidget {
  final Widget child;
  final CoffeeBloc coffeeBloc;

  const CoffeeProvider({
    Key? key,
    required this.child,
    required this.coffeeBloc,
  }) : super(child: child, key: key);

  static CoffeeProvider? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<CoffeeProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

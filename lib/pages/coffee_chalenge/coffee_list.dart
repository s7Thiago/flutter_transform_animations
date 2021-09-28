import 'package:flutter/material.dart';
import 'package:transform_example/pages/coffee_chalenge/model/coffee.dart';

class CoffeeList extends StatefulWidget {
  const CoffeeList({Key? key}) : super(key: key);

  @override
  State<CoffeeList> createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  late final _pageController;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: .35, // * Apenas 3 itens serão visíveis
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
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
              final coffee = coffees[index];
              return Image.asset(coffee.image);
            },
          )
        ],
      ),
    );
  }
}

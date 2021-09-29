import 'package:flutter/material.dart';
import 'package:transform_example/pages/coffee_challenge/model/coffee.dart';

class CoffeeDetailsPage extends StatefulWidget {
  final CoffeeModel coffee;
  const CoffeeDetailsPage({Key? key, required this.coffee}) : super(key: key);

  @override
  _CoffeeDetailsPageState createState() => _CoffeeDetailsPageState();
}

class _CoffeeDetailsPageState extends State<CoffeeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .35),
            child: Hero(
              tag: 'text_${widget.coffee.name}',
              child: Material(
                child: Text(
                  widget.coffee.name,
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
          const SizedBox(height: 30),
          SizedBox(
            height: size.height * .4,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Hero(
                    tag: 'image_${widget.coffee.image}',
                    child: Image.asset(
                      widget.coffee.image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                  left: size.width * .5,
                  bottom: 0,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 1.0, end: 0.0),
                    duration: const Duration(milliseconds: 500),
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(-120, 10 * value),
                        child: child,
                      );
                    },
                    child: Text(
                      '\$${widget.coffee.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 10,
                              spreadRadius: 20,
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

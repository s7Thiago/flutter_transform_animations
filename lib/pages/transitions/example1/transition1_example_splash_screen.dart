import 'package:flutter/material.dart';
import 'package:transform_example/pages/transitions/example1/transitions1_page.dart';

class Transition1ExampleSplashScreen extends StatefulWidget {
  const Transition1ExampleSplashScreen({Key? key}) : super(key: key);

  @override
  State<Transition1ExampleSplashScreen> createState() =>
      _Transition1ExampleSplashScreenState();
}

class _Transition1ExampleSplashScreenState
    extends State<Transition1ExampleSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final _duration = const Duration(seconds: 3);

  @override
  void initState() {
    // Inicializando o controller da animação da logo
    _animationController = AnimationController(
      vsync: this,
      // Especificando a mesma dpuração da exibição da Splash
      duration: _duration,
      lowerBound: 1.0,
      upperBound: 10.0,
    );

    // Adicionando listener para observar quando a animação completar, e abrir a home page
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Transitions1Page(),
          ),
        );
      }
    });

    // Inicia a animação
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animationController,
          child: const FlutterLogo(
            size: 40,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:transform_example/pages/transitions/example1/transitions1_page.dart';

class Transition1ExampleSplashScreen extends StatefulWidget {
  const Transition1ExampleSplashScreen({Key? key}) : super(key: key);

  @override
  State<Transition1ExampleSplashScreen> createState() =>
      _Transition1ExampleSplashScreenState();
}

class _Transition1ExampleSplashScreenState
    extends State<Transition1ExampleSplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Transitions1Page(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Container(),
    );
  }
}

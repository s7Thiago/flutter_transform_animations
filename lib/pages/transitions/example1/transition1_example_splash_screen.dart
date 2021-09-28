import 'package:flutter/material.dart';

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

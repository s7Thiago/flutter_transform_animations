import 'package:flutter/material.dart';

class TransformAnimations1 extends StatefulWidget {
  const TransformAnimations1({Key? key}) : super(key: key);

  @override
  _TransformAnimations1State createState() => _TransformAnimations1State();
}

class _TransformAnimations1State extends State<TransformAnimations1> {
  double _value = .5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 200),
            const SizedBox(height: 15),
            Transform.scale(
              scale: _value * 2.0,
              child: Image.asset('assets/images/logo.png', height: 100),
            ),
            Slider(
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
            Text('Value: ${_value.toStringAsFixed(1)}')
          ],
        ),
      ),
    );
  }
}

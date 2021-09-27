import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TransformAnimations2 extends StatefulWidget {
  const TransformAnimations2({Key? key}) : super(key: key);

  @override
  _TransformAnimations2State createState() => _TransformAnimations2State();
}

class _TransformAnimations2State extends State<TransformAnimations2> {
  List<String> _images = [];

  Future<void> _loadData() async {
    final response = await Dio().get('https://picsum.photos/v2/list');

    setState(() {
      _images = (response.data as List).map((e) {
        return e['download_url'].toString();
      }).toList();
    });
  }

  final _pageController = PageController();
  double _currentPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _pageController.page!;
    });
  }

  @override
  void initState() {
    _loadData();
    _pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transform Example 2'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: PageView.builder(
            itemCount: _images.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              // Extraindo a porcentagem do valor da página atual para a próxima
              final percent = 1 - (_currentPage - index);
              final value = percent.clamp(0.0, 1.0);
              print(percent);

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(value * pi),
                  child: Image.network(
                    _images[index],
                    fit: BoxFit.fitWidth,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

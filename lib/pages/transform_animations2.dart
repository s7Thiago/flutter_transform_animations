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

  void _listener() {}

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
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.network(
                  _images[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
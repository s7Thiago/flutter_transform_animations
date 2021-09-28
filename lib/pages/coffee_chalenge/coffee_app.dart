import 'package:flutter/material.dart';
import 'package:transform_example/pages/coffee_chalenge/coffee_list.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: const CoffeeList(),
    );
  }
}

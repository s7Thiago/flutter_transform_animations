import 'package:flutter/material.dart';
import 'package:transform_example/pages/coffee_challenge/coffee_bloc.dart';
import 'package:transform_example/pages/coffee_challenge/coffee_home.dart';

class CoffeeApp extends StatefulWidget {
  const CoffeeApp({Key? key}) : super(key: key);

  @override
  State<CoffeeApp> createState() => _CoffeeAppState();
}

class _CoffeeAppState extends State<CoffeeApp> {
  final bloc = CoffeeBloc();

  @override
  void initState() {
    bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      // child: const CoffeeList(),
      child: CoffeeProvider(
        coffeeBloc: bloc,
        child: const MaterialApp(home: CoffeeHome()),
      ),
    );
  }
}

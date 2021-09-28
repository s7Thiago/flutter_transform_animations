import 'dart:math';

class CoffeeModel {
  final String name;
  final String image;
  final double price;

  CoffeeModel({
    required this.name,
    required this.image,
    required this.price,
  });

  CoffeeModel copyWith({
    String? name,
    String? image,
    double? price,
  }) {
    return CoffeeModel(
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }
}

double _doubleInRange(Random source, num start, num end) =>
    source.nextDouble() * (end - start) + start;

final random = Random();

// Coffee list
final coffees = List.generate(
  _names.length,
  (index) => CoffeeModel(
    image: 'assets/images/coffee/${index + 1}.png',
    name: _names[index],
    price: _doubleInRange(random, 3, 7),
  ),
);

final _names = [
  'Caramel Macchiato',
  'Caramel Cold Drink',
  'Iced Coffe Mocha',
  'Caramelized Pecan Latte',
  'Toffee Nut Latte',
  'Capuchino',
  'Toffee Nut Iced Latte',
  'Americano',
  'Vietnamese-Style Iced Coffee',
  'Black Tea Latte',
  'Classic Irish Coffee',
  'Toffee Nut Crunch Latte',
];

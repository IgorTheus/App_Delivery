import 'package:appaula04/model/dish.dart';

// Cria a classe restaurant

class Restaurant {
  String id;
  String imagePath;
  String name;
  String description;
  double stars;
  int distance;
  List<String> categories;
  List<Dish> dishes;
  List<Dish> drinks;

  // Cria o construtor

  Restaurant(
      {required this.id,
      required this.imagePath,
      required this.name,
      required this.description,
      required this.stars,
      required this.distance,
      required this.categories,
      required this.dishes,
      required this.drinks});

  // Cria mapa para converter elementos json para o app consumir

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'description': description,
      'stars': stars,
      'distance': distance,
      'categories': categories,
      // função arrow para transformar os pratos em uma lista
      'dishes': dishes.map((dish) => dish.toMap()).toList(),
      'drinks': drinks.map((drink) => drink.toMap()).toList()
    };
  }

  // Queremos receber o mapa para criar o restaurante

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
        id: map['id'],
        imagePath: map['imagePath'],
        name: map['name'],
        description: map['description'],
        stars: map['stars'],
        distance: map['distance'],
        categories: List<String>.from(map['categories']),
        dishes:
            List<Dish>.from(map['dishes'].map((dish) => Dish.fromMap(dish))),
        // nem todo restaurante tem bebidas cadastradas ainda, então
        // se a chave não existir no json, cai pra lista vazia
        drinks: map['drinks'] != null
            ? List<Dish>.from(map['drinks'].map((drink) => Dish.fromMap(drink)))
            : []);
  }

  // Função para converter para String

  @override
  String toString() {
    return '''Restaurant(
    id: $id,
    imagePath: $imagePath,
    name: $name,
    description: $description,
    stars: $stars,
    distance: $distance,
    categories: $categories,
    dishes: ${dishes.length},
    drinks: ${drinks.length}
    
    )''';
  }
}

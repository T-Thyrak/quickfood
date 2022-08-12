class Food {
  late int? id;
  final String name;
  final String description;
  final Categories category;
  final int price;
  final int calories;
  final String imageLink;

  static int idCounter = 0;

  Food({
    this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.calories,
    this.imageLink = "",
  }) {
    id = idCounter++;
  }

  static Categories stringToCat(String string) {
    if (string == 'food') {
      return Categories.food;
    }
    if (string == 'drink') {
      return Categories.drink;
    }
    if (string == 'dessert') {
      return Categories.dessert;
    }
    return Categories.food;
  }

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'],
      description: json['description'],
      category: Food.stringToCat(json['category']),
      price: json['price'] as int,
      calories: json['calories'] as int,
      imageLink: json['imageLink'] ?? "",
    );
  }
  factory Food.fromSnapshot(snapshot) {
    return Food(
      name: snapshot.data()['name'],
      description: snapshot.data()['description'],
      category: Food.stringToCat(snapshot.data()['category']),
      price: snapshot.data()['price'] as int,
      calories: snapshot.data()['calories'] as int,
      imageLink: snapshot.data()['imageLink'] ?? "",
    );
  }
}

enum Categories {
  food,
  drink,
  dessert,
}

class FoodItem {
  final Food food;
  int qty;

  FoodItem({required this.food, required this.qty});
}

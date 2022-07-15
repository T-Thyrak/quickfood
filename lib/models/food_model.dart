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
    required this.imageLink,
  }) {
    id = idCounter++;
  }
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      calories: json['calories'],
      imageLink: json['imageLink'],
    );
  }
}

enum Categories {
  food,
  drink,
  desert,
}

class FoodItem {
  final Food food;
  final int qty;

  const FoodItem({required this.food, required this.qty});
}

class Food {
  final int? id;
  final String name;
  final String description;
  final Categories category;
  final int price;
  final int calories;

  const Food(
      {this.id,
      required this.name,
      required this.description,
      required this.category,
      required this.price,
      required this.calories});
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

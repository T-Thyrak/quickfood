class Food {
  late int? id;
  final String name;
  final String description;
  final Categories category;
  final int price;
  final int calories;

  static int idCounter = 0;

  Food({
    this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.calories,
  }) {
    id = idCounter++;
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

List<Food> foods = [
  Food(
    name: "Spicy Meal",
    description: "Very hot and spicy meal made using recipe from China",
    category: Categories.food,
    price: 225,
    calories: 1300,
  ),
  Food(
    name: "Very Spicy Meal",
    description: "Very hot and spicy meal made using recipe from China",
    category: Categories.food,
    price: 225,
    calories: 1300,
  ),
  Food(
    name: "Fucking Spicy Meal",
    description: "Very hot and spicy meal made using recipe from China",
    category: Categories.food,
    price: 225,
    calories: 1300,
  ),
  Food(
    name: "Even More Spicy Meal",
    description: "Very hot and spicy meal made using recipe from China",
    category: Categories.food,
    price: 225,
    calories: 1300,
  ),
  Food(
    name: "Deathly Spicy Meal",
    description: "Very hot and spicy meal made using recipe from China",
    category: Categories.food,
    price: 225,
    calories: 1300,
  ),
];

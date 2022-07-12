import 'package:quickfood/core/base_import.dart';

class MainFoodHomePageController {
  late Location location;

  MainFoodHomePageController() {
    location = getLocation();
  }

  Location getLocation() {
    return Location(
      country: "Country",
      city: "City",
    );
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

  List<Food> popularFoods = [
    Food(
      name: "Banh Hoi",
      description: "A delicious Vietnamese dish made using recipe from Vietnam",
      category: Categories.food,
      price: 112,
      calories: 430,
    ),
  ];
}

import 'package:quickfood/core/base_import.dart';
import 'package:quickfood/database/food_list.dart';

class MainFoodHomePageController {
  late Location location;
  final FoodListDatabase foodListDatabase = FoodListDatabase();

  MainFoodHomePageController() {
    location = getLocation();
  }

  Location getLocation() {
    return Location(
      country: "Country",
      city: "City",
    );
  }

  // List<Food> foods = [
  //   Food(
  //     name: "Spicy Meal",
  //     description: "Very hot and spicy meal made using recipe from China",
  //     category: Categories.food,
  //     price: 225,
  //     calories: 1300,
  //     imageLink: "",
  //   ),
  //   Food(
  //     name: "Very Spicy Meal",
  //     description: "Very hot and spicy meal made using recipe from China",
  //     category: Categories.food,
  //     price: 225,
  //     calories: 1300,
  //     imageLink: "",
  //   ),
  //   Food(
  //     name: "Fucking Spicy Meal",
  //     description: "Very hot and spicy meal made using recipe from China",
  //     category: Categories.food,
  //     price: 225,
  //     calories: 1300,
  //     imageLink: "",
  //   ),
  //   Food(
  //     name: "Even More Spicy Meal",
  //     description: "Very hot and spicy meal made using recipe from China",
  //     category: Categories.food,
  //     price: 225,
  //     calories: 1300,
  //     imageLink: "",
  //   ),
  //   Food(
  //     name: "Deathly Spicy Meal",
  //     description: "Very hot and spicy meal made using recipe from China",
  //     category: Categories.food,
  //     price: 225,
  //     calories: 1300,
  //     imageLink: "",
  //   ),
  // ];

  List<Food> popularFoods = [
    Food(
      name: "Banh Hoi",
      description: "A delicious Vietnamese dish made using recipe from Vietnam",
      category: Categories.food,
      price: 112,
      calories: 430,
      imageLink: "",
    ),
  ];
}

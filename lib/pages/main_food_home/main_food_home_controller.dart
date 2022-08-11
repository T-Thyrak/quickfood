import 'package:get/get.dart';
import 'package:quickfood/core/base_import.dart';
import 'package:quickfood/database/food_list.dart';
import 'package:quickfood/pages/cart/cart_page_controller.dart';

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
  //var foolDataBaseController = Get.find<FoodListDatabase>();
  //foolDataBaseController.foodDataLoad;
  List<Food> popularFoods = [
    Food(
      name: "Banh Hoi",
      description: "A delicious Vietnamese dish made using recipe from Vietnam",
      category: Categories.food,
      price: 112,
      calories: 430,
      imageLink:
          "https://www.siftandsimmer.com/wp-content/uploads/2021/12/banh-hoi-platter3.jpg",
    ),
    Food(
      name: "Fish amok",
      description:
          "In the Khmer diet, rice and freshwater fish play big roles because of the abundance of both. Amok is a national dish, made from fish, coconut milk and curry paste.  All the ingredients are mixed together and put in banana leaf cups with coconut cream on top, then steamed. Another common form is amok chouk – snails with curry steamed in their shells. It's best served with a plate of hot, steamed rice.",
      category: Categories.food,
      price: 20,
      calories: 1200,
      imageLink:
          "https://southeastasiabackpacker.com/wp-content/uploads/2021/09/Fish-amok-in-Cambodia-2.jpg",
    ),
    Food(
      name: "Samlor machu trey",
      description:
          "Samlor machu trey is a soup that's popular in many households in Cambodia as it is not only easy to make but also has a lovely taste. Its ingredients include fish, garlic, lemongrass, celery, tamarind juice, bean sprouts, pineapple and seasoning with sugar, fish sauce, and salt.",
      category: Categories.food,
      price: 10,
      calories: 1340,
      imageLink:
          "https://a.cdn-hotels.com/gdcs/production193/d1771/5c013c5d-4b9d-466c-b540-ad62517114a1.jpg?impolicy=fcrop&w=1600&h=1066&q=medium",
    ),
    Food(
      name: "Nom banh chok",
      description:
          "Many locals start their day with nom banh chok, a popular dish known as Khmer noodles in English.It consists of rice noodles topped with green fish gravy and lots of fresh vegetables including cucumbers, green beans, mint leaves, banana blossom and bean sprouts. It’s very similar to the Thai dish that's known as kanom jeen.",
      category: Categories.food,
      price: 5,
      calories: 1440,
      imageLink:
          "https://a.cdn-hotels.com/gdcs/production61/d1911/f14df1cc-51e1-46d8-84d9-4db19129f071.jpg?impolicy=fcrop&w=1600&h=1066&q=medium",
    ),
    Food(
      name: "Bai sach chrouk",
      description:
          "The simple and yummy bai sach chrouk is pork marinated in coconut milk or garlic before being brought to a slow grill. It's then served with broken or fractured rice and a small bowl of clear chicken broth as well as some fresh vegetables.As part of the street food culture, it is available everywhere especially in busy neighborhoods. It’s so popular that many middle and upper restaurants also include it on their menus. Try it with iced coffee. The pairing can be very satisfying.",
      category: Categories.food,
      price: 4,
      calories: 240,
      imageLink:
          "https://a.cdn-hotels.com/gdcs/production104/d274/5cf221dc-d674-44b5-be85-8990f2ce6783.jpg?impolicy=fcrop&w=1600&h=1066&q=medium",
    ),
  ];
}

import 'package:get/get.dart';
import 'package:quickfood/core/base_import.dart';

class CartPageController extends GetxController {
  var foodInCard = <FoodItem>[].obs;
  var total = 0.obs;

  void addFood(Food foodData, int amount) {
    foodInCard.add(FoodItem(food: foodData, qty: amount));
    total += foodData.price * amount;
    update();
  }

  void clear() {
    foodInCard.clear();
    total = 0.obs;
    update();
  }

  void incFood(int index) {
    foodInCard[index].qty = foodInCard[index].qty + 1;
    total += foodInCard[index].food.price;
    update();
  }

  void decFood(int index) {
    if (foodInCard[index].qty >= 1) {
      total -= foodInCard[index].food.price;
      foodInCard[index].qty = foodInCard[index].qty - 1;
      if (foodInCard[index].qty == 0) {
        total -= foodInCard[index].food.price;
        removeAFood(index);
      }
    }
    update();
  }

  void removeAFood(int index) {
    foodInCard.removeAt(index);
  }
}

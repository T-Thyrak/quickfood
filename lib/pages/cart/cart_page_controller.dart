import 'package:get/get.dart';
import 'package:quickfood/core/base_import.dart';

class CartPageController extends GetxController {
  var foodInCard = <FoodItem>[].obs;

  void addFood(Food foodData, int amount) {
    foodInCard.add(FoodItem(food: foodData, qty: amount));
    update();
  }

  void clear() {
    foodInCard.clear();
    update();
  }

  void incFood(int index) {
    foodInCard[index].qty = foodInCard[index].qty + 1;
    update();
  }

  void decFood(int index) {
    if (foodInCard[index].qty >= 1) {
      foodInCard[index].qty = foodInCard[index].qty - 1;
      if (foodInCard[index].qty == 0) {
        removeAFood(index);
      }
    }
    update();
  }

  void removeAFood(int index) {
    foodInCard.removeAt(index);
  }
}

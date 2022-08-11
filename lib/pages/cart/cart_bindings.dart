import 'package:get/get.dart';
import 'package:quickfood/database/food_list.dart';
import 'package:quickfood/pages/cart/cart_page_controller.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartPageController());
    Get.lazyPut(() => FoodListDatabase());
  }
}

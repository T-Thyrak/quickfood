import 'package:get/get.dart';
import 'package:quickfood/pages/cart/cart_page_controller.dart';

class Dependencies extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartPageController());
  }
}

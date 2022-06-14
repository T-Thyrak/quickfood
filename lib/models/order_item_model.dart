import 'models.dart';

class OrderItem {
  final FoodItem foodItem;
  late final int orderId;
  final int userId;

  OrderItem({
    required this.foodItem,
    required this.userId,
  });
}

// List<OrderItem> listOrderItems = [
//   OrderItem(foodItem: "piza", userId: "01")
// ];

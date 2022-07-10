import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickfood/core/base_import.dart';

class FoodListDatabase extends ChangeNotifier {
  Future<List<Food>> getData() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("Foods List").get();
    List<Food> foodsList = snapshot.docs
        .map((e) => Food.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    return foodsList;
  }
}

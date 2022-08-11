import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quickfood/core/base_import.dart';

class FoodListDatabase extends GetxController {
  Future<List<Food>> getData() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('Foods List').get();
    //print(snapshot);
    // return snapshot.docs
    //     .map((e) => Food.fromJson(e.data() as Map<String, dynamic>))
    //     .toList();
    //print(snapshot.docs.map((e) => Food.fromSnapshot(e)).toList());
    return snapshot.docs.map((e) => Food.fromSnapshot(e)).toList();

    // final QuerySnapshot snapshot =
    //     await FirebaseFirestore.instance.collection('Foods List').get();
    // return snapshot.docs.map((doc) => doc.data()).toList();
  }

  List<Food> foodDataLoad = <Food>[].obs;

  // List<dynamic> get foodDataLoad {
  //   loadDataFood();
  //   return _foodDataLoad;
  // }

  Future loadDataFood() async {
    foodDataLoad = await getData();
    update();
  }
}

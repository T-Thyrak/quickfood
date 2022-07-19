import 'package:flutter/material.dart';
import 'package:quickfood/pages/food_details/food_detail.dart';
import 'package:quickfood/pages/main_food_home/main_food_home.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MainFoodHomePage();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickfood/core/color.dart';
import 'package:quickfood/database/food_list.dart';
import 'package:quickfood/pages/auth/login/login_page.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Quick Food",
          style: TextStyle(
            color: AppColor.mainColor,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      final foodDataController = Get.find<FoodListDatabase>();
      await foodDataController.loadDataFood();
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      }
    });
  }
}

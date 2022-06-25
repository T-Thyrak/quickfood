import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickfood/pages/my_home.dart';
import 'package:quickfood/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: Routes.routes,
    );
  }
}

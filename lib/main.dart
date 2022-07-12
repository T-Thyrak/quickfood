import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'package:quickfood/pages/auth/login/login_page.dart';
import 'package:quickfood/pages/food_details/food_detail.dart';
import 'package:quickfood/pages/my_home.dart';
import 'package:quickfood/pages/auth/register/register_page.dart';
import 'package:quickfood/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(() => print("LOADED"));
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
      // home: LoginPage(),
      routes: Routes.routes,
    );
  }
}

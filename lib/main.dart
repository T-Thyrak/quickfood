import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'package:quickfood/pages/auth/login/login_page.dart';
import 'package:quickfood/pages/auth/profile/profile_page.dart';
import 'package:quickfood/pages/cart/cart_bindings.dart';
import 'package:quickfood/pages/food_details/food_detail.dart';
import 'package:quickfood/pages/my_home.dart';
import 'package:quickfood/pages/auth/register/register_page.dart';
import 'package:quickfood/routes/routes.dart';

import 'database/food_list.dart';

//import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
          // options: DefaultFirebaseOptions.currentPlatform,
          )
      .whenComplete(() => print("LOADED"));

  //FoodListDatabase().getData();
  // final user = FirebaseAuth.instance.currentUser;
  // print(user);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: LoginPage(),
      //home: ProfilePage(),
      // home: TestRead(),
      routes: Routes.routes,
      initialBinding: CartBindings(),
    );
  }
}

class TestRead extends StatelessWidget {
  TestRead({Key? key}) : super(key: key);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<dynamic>> _getData() async {
    final QuerySnapshot snapshot =
        await _firestore.collection('Foods List').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['name']),
                  subtitle: Text(data[index]['description']),
                  onTap: () {},
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

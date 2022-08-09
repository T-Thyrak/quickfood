import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quickfood/pages/auth/login/login_page.dart';
import 'package:quickfood/pages/my_home.dart';

void checkUser() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user != null) {
      Get.to(() => const MyHomePage(title: "home"),
          transition: Transition.fade);
    } else {
      Get.to(() => const LoginPage());
    }
  });
}

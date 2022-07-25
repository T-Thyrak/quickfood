import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:quickfood/widgets/app_text_field.dart';

import '../../../core/base_import.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _emailController = TextEditingController();
    var _passwsdController = TextEditingController();
    var _nameController = TextEditingController();
    var _phoneController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            AppTextField(
                textEditingController: _emailController,
                hintText: "Email",
                icon: const Icon(
                  Icons.email,
                  color: Colors.yellow,
                )),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              textEditingController: _passwsdController,
              hintText: "Password",
              icon: const Icon(
                Icons.key,
                color: Colors.yellow,
              ),
              isPass: true,
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
                textEditingController: _nameController,
                hintText: "Name",
                icon: const Icon(
                  Icons.person,
                  color: Colors.yellow,
                )),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
                textEditingController: _phoneController,
                hintText: "Phone",
                icon: const Icon(
                  Icons.phone,
                  color: Colors.yellow,
                )),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                final email = _emailController.text;
                final name = _nameController.text;
                final phone = _phoneController.text;
                final password = _passwsdController.text;
                final userCre =
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );
              },
              child: Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColor.mainColor),
                child: const Center(
                  child: BigText(
                    text: "Sign up",
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Have an account already?",
                    style: TextStyle(color: Colors.grey[500], fontSize: 15))),
            const SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
                    text: "Sign Up using Others",
                    style: TextStyle(color: Colors.grey[500], fontSize: 12))),
            const SizedBox(
              height: 10,
            ),
            const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/logos/google-logo.png"),
            )
          ],
        ),
      ),
    );
  }
}

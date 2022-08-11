import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:quickfood/core/base_import.dart';
import 'package:quickfood/pages/auth/register/register_page_controller.dart';
import 'package:quickfood/pages/my_home.dart';
import 'package:quickfood/widgets/app_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Get.to(() => const MyHomePage(title: "home"),
            transition: Transition.fade);
      }
    });
    super.initState();
  }

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
                if (_emailController.text.isEmpty) {
                  loadSnackBar(
                    context,
                    "Email is Empty!",
                  );
                } else if (_nameController.text.isEmpty) {
                  loadSnackBar(
                    context,
                    "Name is Empty!",
                  );
                } else if (_phoneController.text.isEmpty) {
                  loadSnackBar(
                    context,
                    "Phone Number is Empty!",
                  );
                } else if (_passwsdController.text.isEmpty) {
                  loadSnackBar(
                    context,
                    "Password is Empty!",
                  );
                } else {
                  final prefs = await SharedPreferences.getInstance();
                  final email = _emailController.text;
                  final name = _nameController.text;
                  final phone = _phoneController.text;
                  final password = _passwsdController.text;
                  await prefs.setString('phoneNumber', phone);
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    final user = credential.user;
                    await user?.updateDisplayName(name);
                    //await user?.updatePhoneNumber(phone);
                    Get.back();
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("The password provided is too weak."),
                        ),
                      );
                    } else if (e.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "The account already exists for that email."),
                        ),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Unkown Erorr!"),
                      ),
                    );
                  }
                }
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
            GestureDetector(
              onTap: () => googleLogin(),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/logos/google-logo.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

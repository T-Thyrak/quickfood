import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:quickfood/pages/auth/register/register_page.dart';

import '../../../core/base_import.dart';
import '../../../widgets/app_text_field.dart';
import '../../my_home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _emailController = TextEditingController();
    var _passwsdController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hello",
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
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
            GestureDetector(
              onTap: () async {
                final email = _emailController.text;
                final password = _passwsdController.text;

                try {
                  final userCre =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  Get.to(() => const MyHomePage(title: "home"),
                      transition: Transition.fade);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-disabled') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("User email has been disabled."),
                      ),
                    );
                  } else if (e.code == 'invalid-email') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("The email address is not valid."),
                      ),
                    );
                  } else if (e.code == 'user-not-found') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            "There is no user corresponding to the given email."),
                      ),
                    );
                  } else if (e.code == 'wrong-password') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            "The password is invalid for the given email, or the account corresponding to the email does not have a password set."),
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
              },
              child: Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColor.mainColor),
                child: const Center(
                  child: BigText(
                    text: "Sign In",
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
                    text: "Sign In using Others",
                    style: TextStyle(color: Colors.grey[500], fontSize: 12))),
            const SizedBox(
              height: 10,
            ),
            const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/logos/google-logo.png"),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(
                        text: "Don't have an account?",
                        style:
                            TextStyle(color: Colors.grey[500], fontSize: 15))),
                RichText(
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => const RegisterPage(),
                          transition: Transition.fade),
                    text: " Create",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

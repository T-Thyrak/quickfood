import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:quickfood/pages/auth/register/register_page.dart';

import '../../../core/base_import.dart';
import '../../../widgets/app_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwsdController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
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
                textEditingController: emailController,
                hintText: "Email",
                icon: Icon(
                  Icons.email,
                  color: Colors.yellow,
                )),
            SizedBox(
              height: 20,
            ),
            AppTextField(
              textEditingController: passwsdController,
              hintText: "Password",
              icon: Icon(
                Icons.key,
                color: Colors.yellow,
              ),
              isPass: true,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: Dimensions.screenWidth / 2,
              height: Dimensions.screenHeight / 13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColor.mainColor),
              child: Center(
                child: BigText(
                  text: "Sign In",
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
                    text: "Sign In using Others",
                    style: TextStyle(color: Colors.grey[500], fontSize: 12))),
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://play-lh.googleusercontent.com/aFWiT2lTa9CYBpyPjfgfNHd0r5puwKRGj2rHpdPTNrz2N9LXgN_MbLjePd1OTc0E8Rl1",
              ),
            ),
            SizedBox(
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
                          ..onTap = () => Get.to(() => RegisterPage(),
                              transition: Transition.fade),
                        text: " Create",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

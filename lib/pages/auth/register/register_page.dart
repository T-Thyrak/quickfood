import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:quickfood/widgets/app_text_field.dart';

import '../../../core/base_import.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwsdController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 200,
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
            AppTextField(
                textEditingController: nameController,
                hintText: "Name",
                icon: Icon(
                  Icons.person,
                  color: Colors.yellow,
                )),
            SizedBox(
              height: 20,
            ),
            AppTextField(
                textEditingController: phoneController,
                hintText: "Phone",
                icon: Icon(
                  Icons.phone,
                  color: Colors.yellow,
                )),
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
                  text: "Sign up",
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Have an account already?",
                    style: TextStyle(color: Colors.grey[500], fontSize: 15))),
            SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
                    text: "Sign Up using Others",
                    style: TextStyle(color: Colors.grey[500], fontSize: 12))),
            SizedBox(
              height: 10,
            ),
            const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://play-lh.googleusercontent.com/aFWiT2lTa9CYBpyPjfgfNHd0r5puwKRGj2rHpdPTNrz2N9LXgN_MbLjePd1OTc0E8Rl1",
              ),
            )
          ],
        ),
      ),
    );
  }
}

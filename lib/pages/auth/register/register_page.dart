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
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            AppTextField(
                textEditingController: emailController,
                hintText: "Email",
                icon: const Icon(
                  Icons.email,
                  color: Colors.yellow,
                )),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              textEditingController: passwsdController,
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
                textEditingController: nameController,
                hintText: "Name",
                icon: const Icon(
                  Icons.person,
                  color: Colors.yellow,
                )),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
                textEditingController: phoneController,
                hintText: "Phone",
                icon: const Icon(
                  Icons.phone,
                  color: Colors.yellow,
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
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
              backgroundImage: AssetImage("assets/images/google-logo.png"),
            )
          ],
        ),
      ),
    );
  }
}

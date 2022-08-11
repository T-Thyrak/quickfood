import 'package:get/get.dart';
import 'package:quickfood/core/base_import.dart';
import 'package:quickfood/pages/auth/helper.dart';
import 'package:quickfood/pages/cart/cart_page_controller.dart';
import 'package:quickfood/pages/my_home.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  void initState() {
    checkUserPR();

    super.initState();

    final cardController = Get.find<CartPageController>();
    cardController.clear();
    Future.delayed(const Duration(seconds: 2), () async {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MyHomePage(title: "home"),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight / 2.4,
            ),
            Image.asset(
              "assets/logos/CheckMark.png",
              width: 100,
              height: 100,
            ),
            const Text(
              "Food Have Been Orderd!",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

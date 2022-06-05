import 'package:quickfood/core/base_import.dart';
import 'package:quickfood/models/food_model.dart';

class FoodDelail extends StatelessWidget {
  final Food FoodData;
  const FoodDelail({Key? key, required this.FoodData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage("assetsname"))),
              )),
          Positioned(
              top: 45,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart),
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    color: Colors.white),
                child: Text("FOOD NAME"),
              ))
        ],
      ),
    );
  }
}

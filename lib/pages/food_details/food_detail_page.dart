import 'package:quickfood/core/base_import.dart';
import 'package:quickfood/widgets/exandable_text_widgets.dart';

class FoodDelail extends StatelessWidget {
  Food fooddata = foods[0];

  FoodDelail({
    Key? key,
    //required this.fooddata
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int foodcal = fooddata.calories;
    int foodprice = fooddata.price;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //IMG
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/food1.png"))),
              )),
          //ICONS
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
          //TILTE
          Positioned(
              left: 0,
              right: 0,
              top: 300,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: fooddata.name,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SmallText(text: "$foodcal cal"),
                    SizedBox(
                      height: 20,
                    ),
                    BigText(text: "Introduce "),
                    SizedBox(
                      height: 10,
                    ),
                    SmallText(text: fooddata.description),
                  ],
                ),
              )),
          //FoodData
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: AppColor.buttonBackgroundColor,
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColor.signColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColor.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.mainColor),
              child: InkWell(
                child: Row(
                  children: [
                    BigText(text: "\$ $foodprice"),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.point_of_sale_rounded),
                    SizedBox(
                      width: 5,
                    ),
                    BigText(text: "Add to Cart"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

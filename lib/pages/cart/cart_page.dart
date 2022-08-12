import 'package:get/get.dart';
import 'package:quickfood/core/dimensions.dart';
import 'package:quickfood/pages/cart/cart_page_controller.dart';
import 'package:quickfood/pages/map/order_done.dart';
import 'package:quickfood/pages/my_home.dart';
import 'package:quickfood/widgets/app_icon.dart';
import 'package:quickfood/widgets/big_text.dart';
import 'package:quickfood/widgets/small_text.dart';
import 'package:flutter/material.dart';
import '../../core/color.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cardController = Get.find<CartPageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: Dimensions.width20,
              top: Dimensions.height20 * 3,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: AppColor.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => MyHomePage(title: "home"));
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColor.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: AppIcon(
                      icon: Icons.shopping_cart,
                      iconColor: Colors.white,
                      backgroundColor: AppColor.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                ],
              )),
          Positioned(
            top: Dimensions.height20 * 5.0,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              // color: Colors.red,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: cardController.foodInCard.length,
                  itemBuilder: (_, index) {
                    return Container(
                      height: Dimensions.height20 * 5,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Container(
                            width: Dimensions.height20 * 5,
                            height: Dimensions.height20 * 5,
                            margin:
                                EdgeInsets.only(bottom: Dimensions.height10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(cardController
                                      .foodInCard[index].food.imageLink),
                                ),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          Expanded(
                            child: Container(
                              height: Dimensions.height20 * 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(
                                    text: cardController
                                        .foodInCard[index].food.name,
                                    color: Colors.black54,
                                  ),
                                  SmallText(
                                      text:
                                          "${cardController.foodInCard[index].food.calories * cardController.foodInCard[index].qty} cal"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text:
                                            "${cardController.foodInCard[index].food.price * cardController.foodInCard[index].qty}\$",
                                        color: Colors.redAccent,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: Dimensions.height10,
                                            bottom: Dimensions.height10,
                                            right: Dimensions.width10,
                                            left: Dimensions.width10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius20),
                                            color: Colors.white),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  cardController.decFood(index);
                                                });
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: AppColor.signColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Dimensions.width10 / 2,
                                            ),
                                            BigText(
                                                text:
                                                    "${cardController.foodInCard[index].qty}"),
                                            SizedBox(
                                              width: Dimensions.width10 / 2,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  cardController.incFood(index);
                                                });
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: AppColor.signColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
              left: Dimensions.width20,
              top: Dimensions.screenHeight / 1.1,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.mainColor,
                    ),
                    child: BigText(
                      text: "Total: ${cardController.total} \$",
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  GestureDetector(
                    onTap: (() {
                      Get.to(() => LocationPage());
                    }),
                    child: Container(
                      width: 120,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.mainColor,
                      ),
                      child: const Center(
                        child: SmallText(
                          text: "Check out",
                          size: 16,
                          color: AppColor.buttonBackgroundColor,
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

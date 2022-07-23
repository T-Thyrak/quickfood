import 'package:quickfood/core/base_import.dart';
import 'package:quickfood/database/food_list.dart';
import 'package:quickfood/widgets/exandable_text_widgets.dart';
import 'food_detail_controller.dart';

class FoodDetail extends StatefulWidget {
  final Food fooddata;

  FoodDetail({
    Key? key,
    required this.fooddata,
  }) : super(key: key);

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  // final Stream<QuerySnapshot> foods =
  //     FirebaseFirestore.instance.collection("Foods List").snapshots();

  Future<List<Food>> foodData = FoodListDatabase().getData();

  // Food fooddata = foods[0];

  @override
  Widget build(BuildContext context) {
    int foodcal = widget.fooddata.calories;
    int foodprice = (widget.fooddata.price) * quantity;

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
                  image: NetworkImage(widget.fooddata.imageLink),
                ),
              ),
            ),
          ),
          //ICONS
          Positioned(
              top: 45,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const AppIcon(icon: Icons.arrow_back_ios)),
                  GestureDetector(
                      onTap: () {},
                      child: const AppIcon(icon: Icons.shopping_cart)),
                ],
              )),
          //TILTE
          Positioned(
              left: 0,
              right: 0,
              top: 300,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: widget.fooddata.name,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SmallText(text: "$foodcal cal"),
                    const SizedBox(
                      height: 20,
                    ),
                    const BigText(text: "Introduce "),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      child: ExandableTextWidget(
                        text: widget.fooddata.description,
                      ),
                    ),
                  ],
                ),
              )),
          //FoodData 4:25:03
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding:
            const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: AppColor.buttonBackgroundColor,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (() {
                      setState(() {
                        lowQuantity();
                      });
                    }),
                    child: const Icon(
                      Icons.remove,
                      color: AppColor.signColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  BigText(text: "$quantity"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: (() {
                      setState(() {
                        setQuantity();
                      });
                    }),
                    child: const Icon(
                      Icons.add,
                      color: AppColor.signColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.mainColor),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    BigText(text: "\$ $foodprice "),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.point_of_sale_rounded),
                    const SmallText(
                      text: "Add to Cart",
                      size: 16,
                      color: Color.fromARGB(255, 190, 163, 154),
                    ),
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

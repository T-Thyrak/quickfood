import 'package:quickfood/core/base_import.dart';
import 'package:quickfood/database/food_list.dart';
import 'package:quickfood/models/models.dart';
import 'package:quickfood/pages/main_food_home/body/main_food_home_page_body.dart';
import 'package:quickfood/pages/main_food_home/main_food_home_controller.dart';
import 'package:quickfood/widgets/common_widgets.dart';

class MainFoodHomePage extends StatefulWidget {
  MainFoodHomePage({Key? key}) : super(key: key);
  // OrderItem item;

  // MainFoodHomePage(this.item);

  final MainFoodHomePageController controller = MainFoodHomePageController();

  @override
  State<MainFoodHomePage> createState() => _MainFoodHomePageState();
}

class _MainFoodHomePageState extends State<MainFoodHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: widget.controller.foodListDatabase.getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Food> foodList = snapshot.data!;
            return Column(
              children: [
                Container(
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 45,
                      bottom: 15,
                    ),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            BigText(
                              text: widget.controller.location.country,
                              fontFamily: "Comfortaa",
                              color: AppColor.mainColor,
                            ),
                            Row(
                              children: [
                                SmallText(
                                  text: widget.controller.location.city,
                                  fontFamily: "Comfortaa",
                                  color: Colors.black54,
                                ),
                                const Icon(
                                  Icons.arrow_drop_down_rounded,
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColor.mainColor,
                          ),
                          child: const Icon(Icons.search,
                              color: AppColor.whiteColor),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: MainFoodPageBody(
                      foods: foodList,
                      popularFoods: widget.controller.popularFoods,
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

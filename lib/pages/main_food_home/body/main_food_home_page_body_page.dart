import 'package:quickfood/core/base_import.dart';
import 'package:quickfood/pages/food_details/food_detail_page.dart';
import 'package:quickfood/widgets/icon_and_text_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';

class MainFoodPageBody extends StatefulWidget {
  final List<Food> foods;
  final List<Food> popularFoods;

  const MainFoodPageBody({
    Key? key,
    required this.foods,
    required this.popularFoods,
  }) : super(key: key);

  @override
  State<MainFoodPageBody> createState() => _MainFoodPageBodyState();
}

class _MainFoodPageBodyState extends State<MainFoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  double _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        print("Current value is $_currPageValue");
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          child: PageView.builder(
            controller: pageController,
            itemCount: widget.foods.length,
            itemBuilder: (context, index) {
              return _buildPageItem(index);
            },
          ),
        ),
        DotsIndicator(
          dotsCount: widget.foods.length,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9),
            activeColor: AppColor.mainColor,
            activeSize: const Size(18, 9),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(text: "Popular"),
              const SizedBox(
                width: 10,
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 3,
                ),
                child: const BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 3,
                ),
                child: const SmallText(text: "Food pairing"),
              )
            ],
          ),
        ),
        Container(
          height: 700,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            itemCount: widget.popularFoods.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodDetail(
                          fooddata: widget.popularFoods[index],
                          fallbackImage:
                              const AssetImage("assets/images/food1.png"),
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      // imsec
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: Colors.white38,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/food${index + 1}.png"),
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: widget.popularFoods[index].name),
                                const SizedBox(
                                  height: 10,
                                ),
                                SmallText(
                                    text:
                                        widget.popularFoods[index].description),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currPageValue.floor()) {
      double currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      double currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      double currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      double currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      double currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      double currTrans = _height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      double currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: _height,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/food${index + 1}.png",
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: widget.foods[index].name,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: AppColor.mainColor,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const SmallText(
                          text: "4.5",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const SmallText(
                          text: "1287 comments",
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: AppColor.iconColor1,
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "1.7km",
                          iconColor: AppColor.mainColor,
                        ),
                        IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "32min",
                          iconColor: AppColor.iconColor1,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

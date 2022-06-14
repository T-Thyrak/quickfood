import 'package:quickfood/core/base_import.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  final String fontFamily;
  final double size;
  final TextOverflow overflow;

  const BigText({
    Key? key,
    this.color = AppColor.mainBlackColor,
    required this.text,
    this.fontFamily = 'Roboto',
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size,
      ),
    );
  }
}

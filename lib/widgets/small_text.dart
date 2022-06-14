import 'package:quickfood/core/base_import.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  final String fontFamily;
  final double size;
  final double height;

  const SmallText({
    Key? key,
    this.color = AppColor.textColor,
    required this.text,
    this.fontFamily = 'Roboto',
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}

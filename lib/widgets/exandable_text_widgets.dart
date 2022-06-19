import 'package:quickfood/core/base_import.dart';

class ExandableTextWidget extends StatefulWidget {
  final String text;
  ExandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExandableTextWidget> createState() => _ExandableTextWidgetState();
}

class _ExandableTextWidgetState extends State<ExandableTextWidget> {
  late String firstHalf;
  late String latertHalf;
  bool islongs = true;
  double textHeight = 160;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      latertHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      latertHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: latertHalf.isEmpty
          ? SmallText(text: firstHalf)
          : Column(
              children: [
                SmallText(
                    text: islongs
                        ? (firstHalf + "...")
                        : (firstHalf + latertHalf)),
                InkWell(
                  onTap: (() {
                    setState(() {
                      islongs = !islongs;
                    });
                  }),
                  child: Row(
                    children: [
                      SmallText(
                        text: "Show more",
                        color: AppColor.mainColor,
                      ),
                      Icon(
                        islongs ? Icons.arrow_downward : Icons.arrow_upward,
                        color: AppColor.mainColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}

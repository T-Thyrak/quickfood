import 'package:quickfood/core/base_import.dart';

class AccountWiget extends StatelessWidget {
  final AppIcon appIcon;
  final BigText bigText;
  const AccountWiget({
    Key? key,
    required this.appIcon,
    required this.bigText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimensions.width20,
          top: Dimensions.width10,
          bottom: Dimensions.width10),
      child: Row(
        children: [
          appIcon,
          SizedBox(
            width: Dimensions.width20,
          ),
          bigText,
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}

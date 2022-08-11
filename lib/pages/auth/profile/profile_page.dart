import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quickfood/core/base_import.dart';
import 'package:quickfood/pages/auth/helper.dart';
import 'package:quickfood/widgets/account_wiget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    checkUserPR();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final credential = FirebaseAuth.instance;
    final userCredential = credential.currentUser;
    String userName = userCredential?.displayName ?? "NOT FOUND";
    String email = userCredential?.email ?? "NOT FOUND";
    String phoneNumber = userCredential?.phoneNumber ?? "09323234";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: const BigText(
          text: "Profie",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColor.mainColor,
              iconColor: Colors.white,
              iconSize: 75,
              size: Dimensions.height15 * 10,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            AccountWiget(
              appIcon: AppIcon(
                icon: Icons.person,
                backgroundColor: AppColor.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height10 * 5 / 2,
                size: Dimensions.height10 * 5,
              ),
              bigText: BigText(
                text: userName,
              ),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            AccountWiget(
              appIcon: AppIcon(
                icon: Icons.mail,
                backgroundColor: Colors.yellow,
                iconColor: Colors.white,
                iconSize: Dimensions.height10 * 5 / 2,
                size: Dimensions.height10 * 5,
              ),
              bigText: BigText(
                text: email,
                size: 18,
              ),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            AccountWiget(
              appIcon: AppIcon(
                icon: Icons.phone,
                backgroundColor: Colors.yellow,
                iconColor: Colors.white,
                iconSize: Dimensions.height10 * 5 / 2,
                size: Dimensions.height10 * 5,
              ),
              bigText: BigText(
                text: phoneNumber,
              ),
            ),
            //Sign Out
            SizedBox(
              height: Dimensions.height30,
            ),
            GestureDetector(
              onTap: () async {
                credential.signOut();
                await GoogleSignIn().disconnect();
              },
              child: AccountWiget(
                appIcon: AppIcon(
                  icon: Icons.exit_to_app,
                  backgroundColor: Colors.red,
                  iconColor: Colors.white,
                  iconSize: Dimensions.height10 * 5 / 2,
                  size: Dimensions.height10 * 5,
                ),
                bigText: const BigText(
                  text: "Logout",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

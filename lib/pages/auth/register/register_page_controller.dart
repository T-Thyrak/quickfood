import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quickfood/pages/auth/profile/profile_page.dart';

import '../../../core/base_import.dart';
import '../login/login_page.dart';

//final FirebaseAuth auth = FirebaseAuth.instance;

// Future<void> signup(BuildContext context) async {
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//   if (googleSignInAccount != null) {
//     final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;
//     final AuthCredential authCredential = GoogleAuthProvider.credential(
//         idToken: googleSignInAuthentication.idToken,
//         accessToken: googleSignInAuthentication.accessToken);

//     // Getting users credential
//     UserCredential result = await auth.signInWithCredential(authCredential);
//     User? user = result.user;

//     if (result != null) {
//       Get.to(() => const ProfilePage());
//     } // if result not null we simply call the MaterialpageRoute,
//     // for go to the HomePage screen
//   }
// }

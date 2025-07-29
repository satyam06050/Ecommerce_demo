import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_demo/controllers/get_device_token_controller.dart';
import 'package:ecommerce_demo/models/user_model.dart';
import 'package:ecommerce_demo/screens/user_panel/mainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    try {
      final GetDeviceTokenController getDeviceTokenController = Get.put(
        GetDeviceTokenController(),
      );
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn
          .signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential = await _auth.signInWithCredential(
          credential,
        );
        final User? user = userCredential.user;
        if (user != null) {
          UserModel userModel = UserModel(
            uId: user.uid,
            username: user.displayName.toString(),
            email: user.email.toString(),
            phone: user.phoneNumber.toString(),
            userImg: user.photoURL.toString(),
            userDeviceToken: getDeviceTokenController.deviceToken.toString(),
            country: "",
            userAddress: "",
            street: "",
            isAdmin: false,
            isActive: true,
            createdOn: DateTime.now(),
          );
          await FirebaseFirestore.instance
              .collection("users")
              .doc(user.uid)
              .set(userModel.toMap());
          Get.offAll(() => UserMainScreen());
        }
      }
    } catch (e) {
      print("$e");
    }
  }
}

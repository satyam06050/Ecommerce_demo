import 'package:ecommerce_demo/controllers/google_signin-controller.dart';
import 'package:ecommerce_demo/screens/auth_ui/sighUp.dart';
import 'package:ecommerce_demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final GoogleSigninController _googleSigninController = Get.put(
    GoogleSigninController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Welcome",
          style: TextStyle(color: AppConstant.appMainColor),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: Lottie.asset("assets/cart.json")),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "Happy Shopping",
                style: TextStyle(
                  color: AppConstant.appMainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: Get.height / 12),
            Container(
              width: Get.width / 1.4,
              height: Get.height / 15,
              decoration: BoxDecoration(
                color: AppConstant.appMainColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton.icon(
                onPressed: () async {
                  // _googleSigninController.signInWithGoogle();
                },
                label: Text(
                  "Sign in with google",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                icon: Icon(Icons.tap_and_play, color: Colors.white),
              ),
            ),
            SizedBox(height: Get.height / 17),
            Container(
              width: Get.width / 1.4,
              height: Get.height / 15,
              decoration: BoxDecoration(
                color: AppConstant.appMainColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton.icon(
                onPressed: () {
                  Get.to(signUpScreen());
                },
                label: Text(
                  "Sign in with email",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                icon: Icon(Icons.email, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

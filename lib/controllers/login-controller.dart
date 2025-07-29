import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  void loginUser() async {
    if (!_validateInputs()) return;

    try {
      isLoading.value = true;

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      isLoading.value = false;

      Get.snackbar(
        "Success",
        "Logged in successfully!",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate to the main user screen
      // Get.offAll(() => UserMainScreen()); // Replace with your actual screen
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Login Failed",
        e.message ?? "Something went wrong",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      Get.snackbar(
        "Success",
        "Password reset email sent to $email",
        backgroundColor: Get.theme.primaryColor,
        colorText: Colors.white,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.message ?? "Something went wrong",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  bool _validateInputs() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Email and password are required",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

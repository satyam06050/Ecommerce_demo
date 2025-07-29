import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // Controllers for text fields
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  // Loading state
  var isLoading = false.obs;

  // Sign-up function
  void signupUser() async {
    if (_validateInputs()) {
      isLoading.value = true;

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );

        isLoading.value = false;

        Get.snackbar(
          "Success",
          "Account created successfully!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Navigate to user screen or login
        // Get.offAll(() => UserMainScreen());
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;

        Get.snackbar(
          "Error",
          e.message ?? "Sign-up failed",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  bool _validateInputs() {
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "All fields are required!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

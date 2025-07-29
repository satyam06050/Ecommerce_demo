import 'package:ecommerce_demo/controllers/signUPController.dart';

import 'package:ecommerce_demo/screens/auth_ui/sighUp.dart';
import 'package:ecommerce_demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signUpWindowen extends StatelessWidget {
  signUpWindowen({super.key});

  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("SignUp"), backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTextField(
              "Username",
              Icons.person,
              signupController.usernameController,
            ),
            _buildTextField(
              "Email",
              Icons.email,
              signupController.emailController,
            ),
            _buildTextField(
              "Phone",
              Icons.call,
              signupController.phoneController,
              isNumber: true,
            ),
            _buildTextField(
              "Password",
              Icons.password,
              signupController.passwordController,
              obscureText: true,
            ),

            SizedBox(height: Get.height / 20),
            Obx(
              () => signupController.isLoading.value
                  ? CircularProgressIndicator()
                  : Container(
                      width: Get.width / 1.9,
                      height: Get.height / 15,
                      decoration: BoxDecoration(
                        color: AppConstant.appMainColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextButton.icon(
                        onPressed: signupController.signupUser,
                        label: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        icon: Icon(Icons.person_add, color: Colors.white),
                      ),
                    ),
            ),

            SizedBox(height: Get.height / 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: AppConstant.appScendoryColor),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(signUpScreen());
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      color: AppConstant.appScendoryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hint,
    IconData icon,
    TextEditingController controller, {
    bool isNumber = false,
    bool obscureText = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}

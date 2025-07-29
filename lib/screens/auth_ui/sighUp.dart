import 'package:ecommerce_demo/controllers/login-controller.dart';
//import 'package:ecommerce_demo/controllers/login_controller.dart';
import 'package:ecommerce_demo/screens/auth_ui/signUpScreen.dart';
//import 'package:ecommerce_demo/screens/auth_ui/signUpWindowen.dart';
import 'package:ecommerce_demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class signUpScreen extends StatefulWidget {
  signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Sign In"), backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset("assets/cart.json"),

            _buildTextField(
              "Email",
              Icons.email,
              loginController.emailController,
              isPassword: false,
            ),

            SizedBox(height: Get.height / 30),

            _buildTextField(
              "Password",
              Icons.password,
              loginController.passwordController,
              isPassword: true,
            ),

            Row(
              children: [
                InkWell(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: AppConstant.appMainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () {
                    final email = loginController.emailController.text;
                    if (email.isEmail) {
                      loginController.forgotPassword(email);
                    } else {
                      Get.snackbar(
                        "Invalid Email",
                        "Please enter a valid email first.",
                        backgroundColor: Colors.orange,
                        colorText: Colors.white,
                      );
                    }
                  },
                ),
              ],
            ),

            SizedBox(height: Get.height / 20),

            Obx(
              () => loginController.isLoading.value
                  ? CircularProgressIndicator()
                  : Container(
                      width: Get.width / 1.9,
                      height: Get.height / 15,
                      decoration: BoxDecoration(
                        color: AppConstant.appMainColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextButton.icon(
                        onPressed: loginController.loginUser,
                        label: Text(
                          "Sign in",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        icon: Icon(Icons.login, color: Colors.white),
                      ),
                    ),
            ),

            SizedBox(height: Get.height / 80),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(color: AppConstant.appScendoryColor),
                ),
                GestureDetector(
                  onTap: () => Get.to(signUpWindowen()),
                  child: Text(
                    "Sign Up",
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
    bool isPassword = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon),
            suffixIcon: isPassword ? Icon(Icons.visibility_off) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}

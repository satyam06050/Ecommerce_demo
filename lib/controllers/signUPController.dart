import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLogin = false.obs;
  var rememberMe = false.obs;
  var acceptTerms = false.obs;
  var rememberMeLogin = false.obs;

  void toggleLogin(bool value) {
    isLogin.value = value;
  }
}

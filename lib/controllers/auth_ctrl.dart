import 'package:get/get.dart';
import 'package:mobile_hris/core/constant.dart';
import 'package:mobile_hris/services/auth_service.dart';

class AuthCtrl extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  bool isLoading = false;
  var authService = new AuthService();

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  login() async {
    if (email.value.isEmpty || password.value.isEmpty) {
      Get.snackbar('Error', 'Email and password cannot be empty');
    } else {
      var response = await authService.login(email.value, password.value);
      if (response) {
        Get.offAllNamed('/home');
        Get.snackbar(
          'Login Success',
          '',
        );
      } else {
        Get.snackbar('Login Failed', 'Email or password is incorrect');
      }
    }
  }
}

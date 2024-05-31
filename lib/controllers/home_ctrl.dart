import 'package:get/get.dart';
import 'package:mobile_hris/services/auth_service.dart';

class HomeCtrl extends GetxController {
  var authService = new AuthService();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserProfile();
  }

  getUserProfile() async {
    var response = await authService.getUserProfile();
    if (response) {
      print('Get User Profile Success');
    } else {
      print('Get User Profile Failed');
    }
  }
}

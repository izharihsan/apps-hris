import 'package:get_storage/get_storage.dart';
import 'package:mobile_hris/core/api_instance.dart';
import 'package:mobile_hris/core/constant.dart';

class AuthService {
  var apis = getApiClient();

  Future<bool> login(String email, String password) async {
    try {
      final response = await apis.post(baseUrl + '/login', data: {
        'email': email,
        'password': password,
      });
      print(response.data);

      if (response.statusCode == 200) {
        GetStorage().write('token', response.data['token']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // get user profile in /user endpoint
  Future<bool> getUserProfile() async {
    try {
      final response = await apis.get(baseUrl + '/user');
      print(response.data['name']);

      if (response.statusCode == 200) {
        // GetStorage().write('user_id', response.data['id']);
        GetStorage().write('user_name', response.data['name']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

import 'package:get_storage/get_storage.dart';
import 'package:mobile_hris/core/api_instance.dart';
import 'package:mobile_hris/core/constant.dart';
import 'package:dio/dio.dart' as dio;

class AttendanceService {
  var apis = getApiClient();

  currentAttendance() async {
    try {
      final response = await apis.get(baseUrl + '/attendance');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  clock_in(data) async {
    try {
      dio.FormData formData = dio.FormData.fromMap({
        'lat': data['lat'],
        'lng': data['lng'],
        'start_time': data['start_time'],
        'proof_image':
            await dio.MultipartFile.fromFile(data['proof_image'].path),
        'face_recognition':
            await dio.MultipartFile.fromFile(data['face_recognition'].path),
      });

      final response = await apis.post(baseUrl + '/clock-in', data: formData);
      print(response.data);
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  clock_out(data) async {
    try {
      final response = await apis.post(baseUrl + '/clock-out', data: data);
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}

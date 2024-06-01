import 'dart:io';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobile_hris/components/custom_components.dart';
import 'package:mobile_hris/services/attendance_service.dart';

class AttendanceCtrl extends GetxController {
  String? latitude;
  String? longitude;
  String? address;
  var attendData = {}.obs;
  File? selfieImage;
  var attendService = new AttendanceService();

  onInit() {
    super.onInit();
    getLocation();
    getUserAttendance();
  }

  getUserAttendance() async {
    var response = await attendService.currentAttendance();
    print(response);
    if (response != null) {
      attendData.value = response;
      update();
      print('Get Attendance Success');
    } else {
      print('Get Attendance Failed');
    }
  }

  Future<bool> handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Error', 'Location services are disabled.');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Error', 'Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Error',
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }

  getLocation() async {
    bool permission = await handlePermission();
    if (permission) {
      loading('Getting location...');
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      address = place.street.toString() +
          ', ' +
          place.subLocality.toString() +
          ', ' +
          place.locality.toString() +
          ', ' +
          place.administrativeArea.toString() +
          ', ' +
          place.subAdministrativeArea.toString() +
          ', ' +
          place.postalCode.toString() +
          ', ' +
          place.country.toString();
      update();
      Get.back();
    }
  }

  // function to open front camera using image picker, then handle attendance
  openCameraAndHandleAttend() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      imageQuality: 50,
    );
    if (image != null) {
      selfieImage = File(image.path);
      update();
      handleAttendance();
    } else {
      Get.snackbar(
          'Absen Gagal', 'Harus mengambil foto selfie terlebih dahulu');
    }
  }

  // function to handle attendance
  handleAttendance() async {
    loading('Memproses Kehadiran...');
    var currentTime = DateFormat('HH:mm:ss').format(DateTime.now());

    var payload = {
      "lat": latitude,
      "lng": longitude,
      'start_time': currentTime.toString(),
      "proof_image": selfieImage,
      "face_recognition": selfieImage,
    };

    var response = await attendService.clock_in(payload);
    if (response) {
      Get.offAllNamed('/home');
      Get.snackbar('Success', 'Attendance success');
    } else {
      Get.back();
      Get.snackbar('Error', 'Attendance failed');
    }
  }

  handleClockOut() async {
    loading('Memproses Kehadiran...');
    var currentTime = DateFormat('HH:mm:ss').format(DateTime.now());

    var payload = {
      'end_time': currentTime.toString(),
    };

    var response = await attendService.clock_out(payload);
    if (response) {
      Get.offAllNamed('/home');
      Get.snackbar('Success', 'Clock Out success');
    } else {
      Get.back();
      Get.snackbar('Error', 'Clock Out failed');
    }
  }

  String getDurationTimeFromStartTimeAndEndTime() {
    if (attendData['start_time'] != null && attendData['end_time'] != null) {
      var startTime = DateTime.parse('2021-01-01 ' + attendData['start_time']);
      var endTime = DateTime.parse('2021-01-01 ' + attendData['end_time']);

      var difference = endTime.difference(startTime);

      if (difference.inHours > 0) {
        return difference.inHours.toString() +
            ':' +
            (difference.inMinutes % 60).toString();
      } else {
        return '00:' + difference.inMinutes.toString();
      }
    } else {
      return '--:--';
    }
  }
}

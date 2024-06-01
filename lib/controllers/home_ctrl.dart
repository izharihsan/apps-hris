import 'package:get/get.dart';
import 'package:mobile_hris/services/attendance_service.dart';
import 'package:mobile_hris/services/auth_service.dart';

class HomeCtrl extends GetxController {
  var authService = new AuthService();
  var attendService = new AttendanceService();
  String dayString = '';
  String dateNumber = '';
  var attendData = {}.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserProfile();
    setDay();
    getDateNumber();
  }

  String getDay3Letters(int day) {
    switch (day) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return 'Mon';
    }
  }

  setDay() {
    var now = DateTime.now();
    var day = now.weekday;
    dayString = getDay3Letters(day);
    update();
  }

  getDateNumber() {
    var now = DateTime.now();
    var day = now.day;
    dateNumber = day < 10 ? '0$day' : day.toString();
    update();
  }

  getUserProfile() async {
    var response = await authService.getUserProfile();
    if (response) {
      print('Get User Profile Success');
    } else {
      print('Get User Profile Failed');
    }
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

  getTimeNow() {
    // format Day, Date Month Name, Year
    var now = DateTime.now();
    var day = now.day;
    var dateNumber = day < 10 ? '0$day' : day.toString();
    var month = now.month;
    var year = now.year;
    var monthName = '';
    var dayName = '';

    switch (now.weekday) {
      case 1:
        dayName = 'Monday';
        break;
      case 2:
        dayName = 'Tuesday';
        break;
      case 3:
        dayName = 'Wednesday';
        break;
      case 4:
        dayName = 'Thursday';
        break;
      case 5:
        dayName = 'Friday';
        break;
      case 6:
        dayName = 'Saturday';
        break;
      case 7:
        dayName = 'Sunday';
        break;
    }

    switch (month) {
      case 1:
        monthName = 'January';
        break;
      case 2:
        monthName = 'February';
        break;
      case 3:
        monthName = 'March';
        break;
      case 4:
        monthName = 'April';
        break;
      case 5:
        monthName = 'May';
        break;
      case 6:
        monthName = 'June';
        break;
      case 7:
        monthName = 'July';
        break;
      case 8:
        monthName = 'August';
        break;
      case 9:
        monthName = 'September';
        break;
      case 10:
        monthName = 'October';
        break;
      case 11:
        monthName = 'November';
        break;
      case 12:
        monthName = 'December';
        break;
    }
    return '$dayName, $dateNumber $monthName $year';
  }
}

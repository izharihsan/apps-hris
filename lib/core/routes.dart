import 'package:get/route_manager.dart';
import 'package:mobile_hris/screen/attendance_screen.dart';
import 'package:mobile_hris/screen/home_screen.dart';
import 'package:mobile_hris/screen/login_screen.dart';
import 'package:mobile_hris/screen/overtimes/add_overtime_screen.dart';
import 'package:mobile_hris/screen/overtimes/overtime_screen.dart';
import 'package:mobile_hris/screen/splash_screen.dart';

class Routes {
  static final pages = [
    GetPage(
      name: '/splash',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
    ),
    GetPage(
      name: '/attendance',
      page: () => AttendanceScreen(),
    ),
    GetPage(name: '/overtimes', page: () => OvertimeScreen()),
    GetPage(name: '/overtimes/add', page: () => AddOvertimeScreen())
  ];
}

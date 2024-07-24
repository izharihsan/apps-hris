import 'package:get/route_manager.dart';
import 'package:mobile_hris/screen/attendance_screen.dart';
import 'package:mobile_hris/screen/home_screen.dart';
import 'package:mobile_hris/screen/login_screen.dart';
import 'package:mobile_hris/screen/overtimes/add_overtime_screen.dart';
import 'package:mobile_hris/screen/overtimes/overtime_screen.dart';
import 'package:mobile_hris/screen/splash_screen.dart';

class Routes {
  static final pages = [
    GetPage(name: '/splash', page: () => SplashScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/pin_code', page: () => PinCodeScreen()),
    GetPage(name: '/new_pin_code', page: () => NewPinCodeScreen()),
    GetPage(name: '/confirm_pin_code', page: () => ConfirmPinCodeScreen()),
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/profile', page: () => ProfileInformationScreen()),
    GetPage(
        name: '/profile/edit/personal',
        page: () => EditPersonalDetailsScreen()),
    GetPage(
        name: '/profile/edit/contact', page: () => EditContactDetailScreen()),
    GetPage(name: '/attendance', page: () => AttendanceScreen()),
    GetPage(name: '/attendance/list', page: () => AttendanceListScreen()),
    GetPage(name: '/face_recognition', page: () => FaceLiveDetectionScreen()),
    GetPage(name: '/attendance/forgot', page: () => ForgotClockScreen()),
    GetPage(name: '/overtimes', page: () => OvertimeScreen()),
    GetPage(name: '/overtimes/add', page: () => AddOvertimeScreen()),
    GetPage(name: '/overtimes/detail', page: () => OvertimeDetailScreen()),
    GetPage(name: '/timeoff', page: () => TimeoffMenuScreen()),
    GetPage(name: '/timeoff/leave', page: () => LeaveScreen()),
    GetPage(name: '/timeoff/leave/add', page: () => AddLeaveScreen()),
    GetPage(name: '/timeoff/sick_leave', page: () => SickLeaveScreen()),
    GetPage(name: '/timeoff/sick_leave/add', page: () => AddSickLeaveScreen()),
    GetPage(name: '/timeoff/permission', page: () => PermissionScreen()),
    GetPage(name: '/timeoff/permission/add', page: () => AddPermissionScreen()),
    GetPage(name: '/finance', page: () => FinanceMenuScreen()),
    GetPage(name: '/reimbursement', page: () => ReimbursementScreen()),
    GetPage(name: '/reimbursement/add', page: () => AddReimbursementScreen()),
    GetPage(
        name: '/reimbursement/detail', page: () => ReimbursementDetailScreen()),
  ];
}

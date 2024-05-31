import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatelessWidget {
  // redirect to login screen
  void _redirectToLogin(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      if (GetStorage().hasData('token')) {
        Get.offAllNamed('/home');
      } else {
        Get.offAllNamed('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _redirectToLogin(context);
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/HR_logo.png',
              // width: 200,
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Text(
              'Powered By HRIS Amore',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

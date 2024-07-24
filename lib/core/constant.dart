import 'dart:math';
import 'package:flutter/material.dart';

const String baseUrl = 'https://dev-hrm.amoreanimalclinic.com/api/v1';
const String publicUrl = 'https://dev-hrm.amoreanimalclinic.com';
// const String baseUrl = 'http://192.168.54.31:8000/api/v1';
// const String publicUrl = 'http://192.168.54.31:8000';
// I have to finish the project
Color primaryColor = Color(0xff780000);
Color primaryColor2 = Color(0xffC1121F);
Color secondaryColor = Color(0xff737373);
Color darkColor = Color(0xff454545);
Color mutedColor = Color(0xffA8A8A8);
Color blueDeepColor = Color(0xff003049);
Color higlightColor = Color(0xffCEDFEA);
Color redHiglightColor = Color(0xffFF8B8B);

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

var clocks1to24 = [
  '00:00',
  '01:00',
  '02:00',
  '03:00',
  '04:00',
  '05:00',
  '06:00',
  '07:00',
  '08:00',
  '09:00',
  '10:00',
  '11:00',
  '12:00',
  '13:00',
  '14:00',
  '15:00',
  '16:00',
  '17:00',
  '18:00',
  '19:00',
  '20:00',
  '21:00',
  '22:00',
  '23:00',
];

getDateNumberFromTimeStamps(String timestamp) {
  var date = DateTime.parse(timestamp);
  return date.day;
}

getDaysFromTimeStamps(String timestamp) {
  var days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  var date = DateTime.parse(timestamp);
  return days[date.weekday - 1];
}

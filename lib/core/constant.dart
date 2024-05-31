import 'dart:math';
import 'package:flutter/material.dart';

const String baseUrl = 'http://192.168.0.101:8000/api/v1';

Color primaryColor = Color(0xff780000);
Color primaryColor2 = Color(0xffC1121F);
Color secondaryColor = Color(0xff737373);
Color darkColor = Color(0xff454545);
Color mutedColor = Color(0xffA8A8A8);
Color blueDeepColor = Color(0xff003049);

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

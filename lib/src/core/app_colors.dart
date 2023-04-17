import 'package:flutter/material.dart';

class AppColors {
  static Color blackColor = const Color(0xff0a0803);
  static Color redColor = const Color(0xffd64141);
  static Color greenColor = const Color(0xffd0fb95);
  static Color whiteColor = const Color(0xffffffff);
  static Color pinkOrRedColor = const Color(0xffd64141);

  static List<Color> gradientColors = [
    greenColor.withOpacity(0.2),
    greenColor.withOpacity(0.2),
    blackColor.withOpacity(0.5),
    blackColor.withOpacity(0.2),
    blackColor.withOpacity(0.03),
    redColor.withOpacity(0.04),
    redColor.withOpacity(0.2),
    redColor.withOpacity(0.3),
  ];
}

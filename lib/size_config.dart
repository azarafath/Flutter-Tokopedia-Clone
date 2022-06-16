import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// PROPOSIONAL HEIGHT DARI LAYAR
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 DEFAULT FIGMA HEIGHT
  return (inputHeight / 812.0) * screenHeight;
}

// PROPOSIONAL WIDTH DARI LAYAR
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 DEFAULT FIGMA WIDTH
  return (inputWidth / 375.0) * screenWidth;
}

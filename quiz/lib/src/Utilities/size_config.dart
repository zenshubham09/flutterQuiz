import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;

// Safe Area Calculation for iOS
  static double safeAreaHorizontal;
  static double safeAreaVertical;
  static double safeAreaTop;
  static double safeAreaBottom;
  static double safeAreaLeft;
  static double safeAreaRight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    safeAreaTop = _mediaQueryData.padding.top;
    safeAreaBottom = _mediaQueryData.padding.bottom;
    safeAreaLeft = _mediaQueryData.padding.left;
    safeAreaRight = _mediaQueryData.padding.right;

    safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    screenWidth = screenWidth - safeAreaHorizontal;
    screenHeight = screenHeight - safeAreaVertical;
  }
}

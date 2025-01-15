import 'package:flutter/material.dart';

class ResponsiveUtils {
  static double getButtonSize(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.2;
  }

  static double getDisplayFontSize(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.08;
  }

  static EdgeInsets getButtonPadding(BuildContext context) {
    return EdgeInsets.all(getButtonSize(context) * 0.2);
  }

  static double getButtonFontSize(BuildContext context) {
    return getButtonSize(context) * 0.4;
  }
}
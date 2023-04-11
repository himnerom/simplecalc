import 'package:flutter/material.dart';

/// Based on size only ; not the device orientation
enum ScreenSizeOrientation { horizontal, vertical }

class ScreenService {
  /// Returns screen width minus removed SafeArea width
  static double screenWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double leftPadding = MediaQuery.of(context).padding.left;
    double rightPadding = MediaQuery.of(context).padding.right;
    return screenWidth - leftPadding - rightPadding;
  }

  /// Returns screen height minus removed SafeArea height
  static double screenHeight(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double topPadding = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    return screenHeight - topPadding - bottomPadding;
  }

  /// Returns full screen width
  static double screenWidthWithoutSafeArea(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Returns full screen height
  static double screenHeightWithoutSafeArea(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

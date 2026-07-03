import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ScreenService {
  /// Returns screen width minus removed SafeArea width
  static double screenWidth(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double leftPadding = MediaQuery.of(context).padding.left;
    final double rightPadding = MediaQuery.of(context).padding.right;
    return screenWidth - leftPadding - rightPadding;
  }

  /// Returns screen height minus removed SafeArea height
  static double screenHeight(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double topPadding = MediaQuery.of(context).padding.top;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
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

  /// Returns squared layout's size (width & height)
  static double getLayoutSize(BuildContext context) {
    final double screenWidth = ScreenService.screenWidth(context);
    final double screenHeight = ScreenService.screenHeight(context);
    final double layoutSize = screenHeight < screenWidth
        ? screenHeight
        : screenWidth;

    return layoutSize < 600 ? layoutSize : 600;
  }
}

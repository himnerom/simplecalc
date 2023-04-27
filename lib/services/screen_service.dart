import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

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

  /// Returns squared layout's size (width & height)
  static double getLayoutSize(BuildContext context) {
    double screenWidth = ScreenService.screenWidth(context);
    double screenHeight = ScreenService.screenHeight(context);
    double layoutSize = screenHeight < screenWidth ? screenHeight : screenWidth;

    if (kDebugMode) {
      print('Layout size: $layoutSize');
    }

    return layoutSize < 600 ? layoutSize : 600;
  }
}

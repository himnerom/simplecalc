import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:simple_calculator/services/shared_preferences_service.dart';

class ShapeService with ChangeNotifier {
  ShapeService() {
    final tmp = SharedPreferencesService.getDouble(
      SharedPreferencesService.borderRadiusKey,
    );

    _borderRadius = tmp ?? _borderRadius;
    notifyListeners();
  }

  double get borderRadius => _borderRadius;
  double _borderRadius = 12;

  void changeBorderRadius(double borderRadius) {
    _borderRadius = borderRadius;
    SharedPreferencesService.setValue(
      SharedPreferencesService.borderRadiusKey,
      borderRadius,
    );
    notifyListeners();
  }
}

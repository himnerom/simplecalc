import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:simple_calculator/services/shared_preferences_service.dart';

class ShapeService with ChangeNotifier {
  ShapeService() {
    final double? tmp = SharedPreferencesService.getValue(
      SharedPreferencesService.borderRadiusKey,
    );
    _borderRadius = tmp ?? _borderRadius;
    notifyListeners();
  }

  double _borderRadius = 12;

  double get borderRadius => _borderRadius;

  void changeBorderRadius(double borderRadius) {
    _borderRadius = borderRadius;
    SharedPreferencesService.setValue(
      SharedPreferencesService.borderRadiusKey,
      borderRadius,
    );
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:simple_calculator/repositories/shared_preferences_service.dart';

class ShapeService with ChangeNotifier {
  ShapeService() {
    getPreferredShape();
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

  getPreferredShape() async {
    double? tmp = await SharedPreferencesService.getValue(
      SharedPreferencesService.borderRadiusKey,
    );
    if (tmp != null) {
      _borderRadius = tmp;
    }
    notifyListeners();
  }
}

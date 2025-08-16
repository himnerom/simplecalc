import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShapeProvider extends Notifier<double> {
  static const borderRadiusKey = 'border_radius_key';
  static const List<double> radiusesList = [
    2, // Solid
    12, // Round
    42, // Circle
    // null, // Hidden
  ];

  @override
  double build() {
    SharedPreferences.getInstance().then((prefs) {
      double? radius = prefs.getDouble(borderRadiusKey);
      if (radius != null) {
        state = radius;
      }
    });

    return 12;
  }

  void changeBorderRadius(double radius) {
    if (radiusesList.contains(radius)) {
      state = radius;
      SharedPreferences.getInstance().then(
        (prefs) => prefs.setDouble(borderRadiusKey, radius),
      );
    }
  }
}

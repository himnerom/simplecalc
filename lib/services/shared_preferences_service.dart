import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const borderRadiusKey = 'border_radius_key';

  static late final SharedPreferences _p;

  /// Init
  static Future<void> init() async {
    _p = await SharedPreferences.getInstance();
  }

  static dynamic getValue(String key) => _p.get(key);

  static Future<bool> setValue(String key, dynamic content) async {
    if (content is String) {
      return _p.setString(key, content);
    } else if (content is bool) {
      return _p.setBool(key, content);
    } else if (content is int) {
      return _p.setInt(key, content);
    } else if (content is double) {
      return _p.setDouble(key, content);
    } else if (content is List<String>) {
      return _p.setStringList(key, content);
    }
    return false;
  }
}

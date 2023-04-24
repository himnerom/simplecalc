import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const borderRadiusKey = 'border_radius_key';

  static void setValue(String key, dynamic content) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (content is String) {
      preferences.setString(key, content);
    } else if (content is bool) {
      preferences.setBool(key, content);
    } else if (content is int) {
      preferences.setInt(key, content);
    } else if (content is double) {
      preferences.setDouble(key, content);
    } else if (content is List<String>) {
      preferences.setStringList(key, content);
    }
  }

  static dynamic getValue(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get(key);
  }
}

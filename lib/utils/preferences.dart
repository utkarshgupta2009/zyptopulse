import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String _themeKey = 'theme_mode';
  static const String _firstLaunchKey = 'first_launch';

  static Future<String?> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeKey);
  }

  static Future<void> setTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, theme);
  }

  static Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstLaunchKey) ?? true;
  }

  static Future<void> setFirstLaunch(bool isFirst) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstLaunchKey, isFirst);
  }
  
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
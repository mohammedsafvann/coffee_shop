import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String _boolKey = "login";
  static const String _stringKey = "userUid";

  static Future<void> saveBoolValue({required bool value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_boolKey, value);
  }

  static Future<void> saveStringValue({required String uid}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_stringKey, uid);
  }

  static Future<bool?> getBoolValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_boolKey);
  }

  static Future<String?> getStringValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_stringKey);
  }
}

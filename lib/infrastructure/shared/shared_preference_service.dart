import 'package:shared_preferences/shared_preferences.dart';

class   SharedPreferenceService {
  static SharedPreferenceService? _instance;
  static SharedPreferences? _preferences;

   static Future<SharedPreferenceService> getInstance() async {
    _instance ??= SharedPreferenceService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  // General Methods: ----------------------------------------------------------

  static clearPreference() async {
    await getInstance();
    await _preferences!.clear();
  }

  static Future<void> saveIntValue(String key, int value) async {
    await getInstance();
    await _preferences!.setInt(key, value);
  }

  static Future<void> saveStringValue(String key, String value) async {
    await getInstance();
    await _preferences!.setString(key, value);
  }

  static Future<String?> getStringValue(String key) async {
    await getInstance();
    try {
      return _preferences!.getString(key);
    } catch (e) {
      return null;
    }
  }

  static Future<int?> getIntValue(String key) async {
    await getInstance();
    try {
      return _preferences!.getInt(key);
    } catch (e) {
      return null;
    }
  }

}

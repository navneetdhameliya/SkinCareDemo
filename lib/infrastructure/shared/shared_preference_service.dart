import 'package:shared_preferences/shared_preferences.dart';
import 'package:skincaredemo/infrastructure/commons/constants/storage_constants.dart';

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

  static Future<void> saveBoolValue(String key, bool value) async {
    await getInstance();
    await _preferences!.setBool(key, value);
  }

  static Future<void> saveIntValue(String key, int value) async {
    await getInstance();
    await _preferences!.setInt(key, value);
  }
  static Future<void> saveGuestAccount(String key, bool value) async {
    await getInstance();
    await _preferences!.setBool(key, value);
  }
  static Future<bool?> getGuestAccount(String key) async {
    await getInstance();
    try {
      return _preferences!.getBool(key);
    } catch (e) {
      return null;
    }
  }

  static Future<bool?> getBoolValue(String key) async {
    await getInstance();
    try {
      return _preferences!.getBool(key);
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

  //user name
  static Future<String> get getUserName async {
    await getInstance();
    return _preferences!.getString(StorageConstants.username) ?? "";
  }

  static Future<void> saveUsername(String saveUsername) async {
    await getInstance();
    await _preferences!.setString(StorageConstants.username, saveUsername);
  }

}

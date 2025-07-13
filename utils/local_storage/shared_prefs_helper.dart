import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHelper {
  static SharedPreferences? _prefs;

  /// Initialize SharedPreferences (call once before use)
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Save String
  static Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  /// Get String
  static String? getString(String key) {
    return _prefs?.getString(key);
  }

  /// Save Int
  static Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  /// Get Int
  static int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  /// Save Bool
  static Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  /// Get Bool
  static bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  /// Save Double
  static Future<void> setDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  /// Get Double
  static double? getDouble(String key) {
    return _prefs?.getDouble(key);
  }

  /// Save String List
  static Future<void> setStringList(String key, List<String> value) async {
    await _prefs?.setStringList(key, value);
  }

  /// Get String List
  static List<String>? getStringList(String key) {
    return _prefs?.getStringList(key);
  }

  /// Remove a key
  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  /// Clear all
  static Future<void> clearAll() async {
    await _prefs?.clear();
  }
}

// void main() async {
//   await LocalStorageHelper.init();

//   // Set
//   await LocalStorageHelper.setString('token', 'abc123');

//   // Get
//   String? token = LocalStorageHelper.getString('token');
//   print('Stored token: $token');

//   // Remove
//   await LocalStorageHelper.remove('token');

//   // Clear all
//   await LocalStorageHelper.clearAll();
// }


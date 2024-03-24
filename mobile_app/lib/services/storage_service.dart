import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static void setDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  static Future<bool> getDarkMode(bool defaultValue) async {
    return await setDefault<bool>('darkMode', defaultValue);
  }

  static Future<T> setDefault<T>( String key, T value) async {
    final instance = await SharedPreferences.getInstance();
    final T result = instance.get(key) as T;

    if (result != null) return result;

    if (T is bool) {
      await instance.setBool(key, value as bool);
    } else if (T is String) {
      await instance.setString(key, value as String);
    } else if (T is int) {
      await instance.setInt(key, value as int);
    } else if (T is double) {
      await instance.setDouble(key, value as double);
    }
    return value;
  }
}

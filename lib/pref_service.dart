import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  Future<void> createString(String key, String value) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    await _pref.setString(key, value);
  }

  Future<String?> readString(String key) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var cache = _pref.getString(key);
    return cache;
  }
}

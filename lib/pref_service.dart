import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  Future<void> createString(String key, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(key, value);
  }

  Future<String?> readString(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var cache = pref.getString(key);
    return cache;
  }
}

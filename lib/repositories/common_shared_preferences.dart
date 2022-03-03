import 'package:shared_preferences/shared_preferences.dart';

class CommonSharedPreferences {
  static SharedPreferences? _instance;

  CommonSharedPreferences() {
    if (_instance == null) _init();
  }

  void _init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static int? getInt(key) {
    return _instance?.getInt(key);
  }

  static String? getString(key) {
    return _instance?.getString(key);
  }

  static List<String>? getStringList(key) {
    return _instance?.getStringList(key);
  }

  static Future<bool> setInt(String key, int value) async {
    return await _instance!.setInt(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    return await _instance!.setStringList(key, value);
  }

  static Future<List<String>?> getStringListWithExpireTime(
    String key,
    String keyExpire,
  ) async {
    var result1 = CommonSharedPreferences.getStringList(key);
    var time = DateTime.now().microsecondsSinceEpoch;
    var result2 = CommonSharedPreferences.getInt(keyExpire);

    if (result1 == null || result2 == null || result2 < time) {
      await _instance!.remove(keyExpire);
      await _instance!.remove(key);
      return null;
    }
    return result1;
  }

  static Future<bool> setStringListWithExpireTime(
    String key,
    String keyExpire,
    List<String> value, [
    int expireMinute = 30,
  ]) async {
    var result1 = await CommonSharedPreferences.setStringList(key, value);
    var time = DateTime.now()
        .add(Duration(minutes: expireMinute))
        .microsecondsSinceEpoch;
    var result2 = await CommonSharedPreferences.setInt(keyExpire, time);
    return result1 & result2;
  }
}

class SharedPreferencesKeyList {
  static String selectedGkData = "LIST_JSON-SELECTED_GOALKEEPER_DATA";
  static String selectedDefData = "LIST_JSON-SELECTED_DEFENDER_DATA";
  static String selectedMidData = "LIST_JSON-SELECTED_MIDFIELDER_DATA";
  static String selectedFwdData = "LIST_JSON-SELECTED_FORWARD_DATA";

  static String starterGameweekData(int gameweek) =>
      "LIST_JSON-STARTER-GAMEWEEK-$gameweek";
  static String benchGameweekData(int gameweek) =>
      "LIST_JSON-BENCH-GAMEWEEK-$gameweek";

  static String gameweeksData = "LIST_JSON-GAMEWEEKS_DATA";
  static String gameweeksDataExpireTime =
      "LIST_JSON-GAMEWEEKS_DATA_EXPIRE_TEAM";
}

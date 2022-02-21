import 'package:shared_preferences/shared_preferences.dart';

class CommonSharedPreferences {
  static SharedPreferences? _instance;

  CommonSharedPreferences() {
    if (_instance == null) _init();
  }

  void _init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static String? getString(key) {
    return _instance?.getString(key);
  }

  static List<String>? getStringList(key) {
    return _instance?.getStringList(key);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    return await _instance!.setStringList(key, value);
  }
}

class SharedPreferencesKeyList {
  static String selectedGkData = "LIST_JSON-SELECTED_GOALKEEPER_DATA";
  static String selectedDefData = "LIST_JSON-SELECTED_DEFENDER_DATA";
  static String selectedMidData = "LIST_JSON-SELECTED_MIDFIELDER_DATA";
  static String selectedFwdData = "LIST_JSON-SELECTED_FORWARD_DATA";
}

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late final SharedPreferences _sharedPreferences;

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setListId(List<int> id) async {
    String value = json.encode(id);
    return await _sharedPreferences.setString("idList", value);
  }

  static List<int>? getListId() {
    String? savedValue = _sharedPreferences.getString("idList");
    if (savedValue != null) {
      List<dynamic> loadedValue = json.decode(savedValue);
      List<int> myList = loadedValue.cast<int>();
      return myList;
    }
    return [];
  }

  static Future<bool> removeId(int value) async {
    List<int>? myList = getListId();
    if (myList != null) {
      myList.remove(value);
      String updatedValue = json.encode(myList);
      return await _sharedPreferences.setString("idList", updatedValue);
    }
    return false;
  }
}

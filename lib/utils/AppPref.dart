// Created by Sanjeev Sangral on 19/09/21.
import 'dart:convert';

import 'package:game_tv/model/PrefModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  static AppPref _appPref;
  static SharedPreferences _preferences;
  static String key = "user_detail";

  static Future<AppPref> getInstance() async {
    if (_appPref == null) {
      // keep local instance till it is fully initialized.
      var secureStorage = AppPref._();
      await secureStorage._init();
      _appPref = secureStorage;
    }
    return _appPref;
  }

  AppPref._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static PrefModel getPref() {
    String pref = _preferences.getString(key);
    if (pref != null) {
      PrefModel model = PrefModel.fromJson(json.decode(pref));
      return model;
    } else {
      return new PrefModel();
    }
  }

  static setPref(value) {
    _preferences.setString(key, json.encode(value));
  }

  static clearPref() {
    _preferences.remove(key);
  }

  static clearAll(){
    _preferences.clear();
  }
}

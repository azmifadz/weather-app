import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/app/constants/constant.dart';
import 'package:weather/app/models/weather.dart';

class AppSharedPreferences {
  AppSharedPreferences._();
  static final instance = AppSharedPreferences._();

  Future<WeatherResponseData?> readResponseData() async {
    final prefs = await SharedPreferences.getInstance();
    final stringData = prefs.getString(sharedPrefsKey);

    if (stringData != null) {
      final jsonData = json.decode(stringData) as Map<String, dynamic>;
      return jsonData.isNotEmpty
          ? WeatherResponseData.fromJson(jsonData)
          : null;
    } else {
      return null;
    }
  }

  Future<void> saveResponseData(WeatherResponseData data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(sharedPrefsKey, json.encode(data.toJson()));
  }
}

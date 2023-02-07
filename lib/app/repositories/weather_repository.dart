import 'package:weather/app/database/shared_prefs.dart';
import 'package:weather/app/models/weather.dart';
import 'package:weather/app/network/api_client.dart';

class WeatherRepository {
  WeatherRepository({
    required this.apiClient,
    required this.sharedPreferences,
  });

  final ApiClient apiClient;
  final AppSharedPreferences sharedPreferences;

  Future<WeatherResponseData> getWeatherResponseDataFromApi({
    required String id,
    required String appid,
  }) async {
    return apiClient.getWeather(
      id: id,
      appid: appid,
    );
  }

  Future<WeatherResponseData?> getWeatherResponseDataFromSharedPrefs() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return sharedPreferences.readResponseData();
  }

  Future<void> saveWeatherResponseDataInSharedPrefs(
    WeatherResponseData data,
  ) async {
    return sharedPreferences.saveResponseData(data);
  }
}

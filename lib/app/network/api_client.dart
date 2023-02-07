import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather/app/models/weather.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient({required Dio httpClient, required String baseUrl}) {
    return _ApiClient(httpClient, baseUrl: baseUrl);
  }

  @GET('/data/2.5/forecast')
  Future<WeatherResponseData> getWeather({
    @Query('id') required String id,
    @Query('appid') required String appid,
  });
}

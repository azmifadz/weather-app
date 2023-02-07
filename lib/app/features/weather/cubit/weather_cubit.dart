import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/app/constants/constant.dart';
import 'package:weather/app/models/weather.dart';
import 'package:weather/app/repositories/weather_repository.dart';
import 'package:weather/app/utils/date_time_util.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.weatherRepository})
      : super(const WeatherInitial());

  final WeatherRepository weatherRepository;

  Future<void> fetchWeather({String? id}) async {
    final responseData = state.weatherResponseData;

    emit(WeatherLoading(data: responseData));

    final locationId = id ?? locationIdConst;
    const appid = appIdConst;

    try {
      WeatherResponseData? weatherList;

      weatherList =
          await weatherRepository.getWeatherResponseDataFromSharedPrefs();

      if (weatherList != null) {
        emit(WeatherLoadSuccess(data: weatherList));
      }

      weatherList = await weatherRepository.getWeatherResponseDataFromApi(
        id: locationId,
        appid: appid,
      );

      await weatherRepository.saveWeatherResponseDataInSharedPrefs(weatherList);

      emit(WeatherLoadSuccess(data: weatherList));
    } on Exception {
      emit(
        WeatherLoadError(error: 'Unable to load weather', data: responseData),
      );
    }
  }
}

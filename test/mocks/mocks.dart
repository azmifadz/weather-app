import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/app/features/weather/weather.dart';
import 'package:weather/app/models/weather.dart';
import 'package:weather/app/repositories/weather_repository.dart';

class MockWeatherCubit extends MockCubit<WeatherState>
    implements WeatherCubit {}

class MockWeatherRepository extends Mock implements WeatherRepository {}

class WeatherResponseDataFake extends Fake implements WeatherResponseData {}

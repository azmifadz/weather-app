import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/app/constants/constant.dart';
import 'package:weather/app/features/weather/cubit/weather_cubit.dart';
import 'package:weather/app/repositories/weather_repository.dart';

import '../../../../mocks/mocks.dart';
import '../../../../mocks/weather_mocks.dart';

void main() {
  group('WeatherCubit', () {
    late WeatherRepository weatherRepository;
    late WeatherCubit weatherCubit;

    setUp(() async {
      weatherRepository = MockWeatherRepository();
      weatherCubit = WeatherCubit(weatherRepository: weatherRepository);
    });

    setUpAll(() {
      registerFallbackValue(WeatherResponseDataFake());
    });

    test('initial state is correct', () {
      final weatherCubit = WeatherCubit(weatherRepository: weatherRepository);
      expect(weatherCubit.state, const WeatherInitial());
    });

    blocTest<WeatherCubit, WeatherState>(
      'calls getWeather will retrieve from SharedPreferences and API',
      build: () {
        when(
          () => weatherRepository.getWeatherResponseDataFromSharedPrefs(),
        ).thenAnswer((_) async => buildMockResponseData());

        when(
          () => weatherRepository.getWeatherResponseDataFromApi(
            id: locationIdConst,
            appid: appIdConst,
          ),
        ).thenAnswer((_) async => buildMockResponseData());

        when(
          () => weatherRepository.saveWeatherResponseDataInSharedPrefs(any()),
        ).thenAnswer((_) async => {});

        return weatherCubit;
      },
      act: (cubit) => cubit.fetchWeather(),
      verify: (_) {
        verify(
          () => weatherRepository.getWeatherResponseDataFromSharedPrefs(),
        ).called(1);
      },
    );

    blocTest<WeatherCubit, WeatherState>(
      'emits [WeatherLoading, WeatherLoadError] when '
      'getWeatherResponseDataFromSharedPrefs throws',
      build: () {
        when(
          () => weatherRepository.getWeatherResponseDataFromSharedPrefs(),
        ).thenThrow(Exception('oops'));
        return weatherCubit;
      },
      act: (cubit) => cubit.fetchWeather(),
      expect: () => <WeatherState>[
        const WeatherLoading(),
        const WeatherLoadError(error: 'Unable to load weather'),
      ],
    );
  });
}

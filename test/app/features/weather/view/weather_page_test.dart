import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/app/features/weather/weather.dart';
import 'package:weather/app/widgets/weather_card.dart';

import '../../../../helpers/helpers.dart';
import '../../../../mocks/mocks.dart';
import '../../../../mocks/weather_mocks.dart';

void main() {
  group('WeatherPage', () {
    late WeatherCubit weatherCubit;

    setUp(() {
      weatherCubit = MockWeatherCubit();
      SharedPreferences.setMockInitialValues({});
    });

    testWidgets('renders WeatherView', (tester) async {
      when(() => weatherCubit.fetchWeather()).thenAnswer(
        (_) => Future.value(),
      );

      await tester.pumpApp(const WeatherPage());
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(WeatherView), findsOneWidget);
    });

    testWidgets('renders WeatherCard when WeatherLoadSuccess', (tester) async {
      when(() => weatherCubit.fetchWeather()).thenAnswer(
        (_) => Future.value(),
      );
      when(() => weatherCubit.state).thenReturn(
        WeatherLoadSuccess(data: buildMockResponseData()),
      );

      await tester.pumpApp(
        BlocProvider.value(
          value: weatherCubit,
          child: const WeatherView(),
        ),
      );

      expect(find.byType(WeatherCard), findsOneWidget);
    });
  });
}

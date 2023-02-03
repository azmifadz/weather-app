import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather/app/features/weather/weather.dart';

import '../../../../helpers/helpers.dart';

class MockWeatherCubit extends MockCubit<int> implements WeatherCubit {}

void main() {
  group('WeatherPage', () {
    testWidgets('renders WeatherView', (tester) async {
      await tester.pumpApp(const WeatherPage());
      expect(find.byType(WeatherView), findsOneWidget);
    });
  });
}

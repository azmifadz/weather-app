import 'package:flutter_test/flutter_test.dart';
import 'package:weather/app/widgets/weather_card.dart';

import '../../helpers/pump_app.dart';
import '../../mocks/weather_mocks.dart';

void main() {
  group('WeatherCard', () {
    testWidgets('renders WeatherCard', (tester) async {
      await tester.pumpApp(
        WeatherCard(
          dailyWeatherList: mockDailyWeatherList(),
        ),
      );
      expect(find.byType(WeatherCardHeader), findsOneWidget);
      expect(find.byType(WeatherCardMain), findsOneWidget);
      expect(find.byType(WeatherCardList), findsOneWidget);
    });
  });
}

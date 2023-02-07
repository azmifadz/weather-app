import 'package:weather/app/models/weather.dart';

List<Weather> mockDailyWeatherList() {
  return [
    Weather(
      date: 1486026000,
      main: WeatherMain(
        temp: 263.455,
        tempMin: 263.455,
        tempMax: 263.455,
        pressure: 1019.32,
        seaLevel: 1040.84,
        groundLevel: 1019.32,
        humidity: 84,
        tempKf: 0,
      ),
      weather: [
        WeatherDetail(
          id: 800,
          main: 'Clear',
          description: 'clear sky',
          icon: '01d',
        ),
      ],
      clouds: Clouds(all: 0),
      wind: Wind(
        speed: 3.06,
        deg: 344.004,
      ),
      dateText: '2017-02-02 09:00:00',
    )
  ];
}

WeatherResponseData buildMockResponseData() {
  return WeatherResponseData(list: mockDailyWeatherList());
}

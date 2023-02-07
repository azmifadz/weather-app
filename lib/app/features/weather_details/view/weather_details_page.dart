import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather/app/models/weather.dart';
import 'package:weather/app/translations/locale_keys.g.dart';
import 'package:weather/app/utils/date_time_util.dart';

class WeatherDetailsPage extends StatelessWidget {
  const WeatherDetailsPage({
    required this.dailyWeatherList,
    super.key,
  });

  final List<Weather> dailyWeatherList;

  @override
  Widget build(BuildContext context) {
    return WeatherDetailsView(dailyWeatherList: dailyWeatherList);
  }
}

class WeatherDetailsView extends StatelessWidget {
  const WeatherDetailsView({
    required this.dailyWeatherList,
    super.key,
  });

  final List<Weather> dailyWeatherList;

  @override
  Widget build(BuildContext context) {
    final date = dailyWeatherList.first.dateText;
    final icon = dailyWeatherList.first.weather[0].icon;
    final condition = dailyWeatherList.first.weather[0].main;
    final wind = dailyWeatherList.first.wind.speed;
    final currentTemp = dailyWeatherList.first.main.temp;
    final maxTemp = dailyWeatherList.first.main.tempMax;
    final minTemp = dailyWeatherList.first.main.tempMin;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.appName.tr(),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          Container(
            color: Colors.lightBlue,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                formattedDateTime(date),
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          CachedNetworkImage(
            imageUrl: 'https://openweathermap.org/img/wn/$icon@2x.png',
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(
              condition.toUpperCase(),
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(
            thickness: 2,
            indent: 24,
            endIndent: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Wind: $wind',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current: ${currentTemp.toCelsius().toStringAsFixed(2)} °C',
                  ),
                  Text(
                    'Max: ${maxTemp.toCelsius().toStringAsFixed(2)} °C',
                  ),
                  Text(
                    'Min: ${minTemp.toCelsius().toStringAsFixed(2)} °C',
                  ),
                ],
              )
            ],
          ),
          const Divider(
            thickness: 2,
            indent: 24,
            endIndent: 24,
          ),
        ],
      ),
    );
  }
}

extension on double {
  double toCelsius() => (this - 32) * 5 / 9;
}

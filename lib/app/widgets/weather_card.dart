import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather/app/features/weather_details/weather_details.dart';
import 'package:weather/app/models/weather.dart';
import 'package:weather/app/utils/date_time_util.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    required this.dailyWeatherList,
    super.key,
  });

  final List<Weather> dailyWeatherList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push<MaterialPageRoute<dynamic>>(
          context,
          MaterialPageRoute(
            builder: (context) => WeatherDetailsPage(
              dailyWeatherList: dailyWeatherList,
            ),
          ),
        );
      },
      child: ClipRRect(
        child: Card(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              WeatherCardHeader(
                dateText: dailyWeatherList.first.dateText,
              ),
              WeatherCardMain(
                icon: dailyWeatherList.first.weather[0].icon,
                condition: dailyWeatherList.first.weather[0].main,
                dateText: dailyWeatherList.first.dateText,
              ),
              WeatherCardList(dailyWeatherList: dailyWeatherList),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherCardHeader extends StatelessWidget {
  const WeatherCardHeader({required this.dateText, super.key});

  final String dateText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          formattedDate(dateText),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}

class WeatherCardMain extends StatelessWidget {
  const WeatherCardMain({
    required this.icon,
    required this.condition,
    required this.dateText,
    super.key,
  });

  final String icon;
  final String condition;
  final String dateText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://openweathermap.org/img/wn/$icon@2x.png',
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                condition,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                formattedTime(dateText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WeatherCardList extends StatelessWidget {
  const WeatherCardList({
    required this.dailyWeatherList,
    super.key,
  });

  final List<Weather> dailyWeatherList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: dailyWeatherList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const VerticalDivider(
            color: Colors.black,
            indent: 16,
            endIndent: 16,
          );
        },
        itemBuilder: (context, index) {
          final dailyWeather = dailyWeatherList[index];

          return Column(
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://openweathermap.org/img/wn/${dailyWeather.weather[0].icon}.png',
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  formattedTime(dailyWeather.dateText),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

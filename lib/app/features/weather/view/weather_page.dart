import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/app/constants/constant.dart';
import 'package:weather/app/database/shared_prefs.dart';
import 'package:weather/app/features/weather/weather.dart';
import 'package:weather/app/models/weather.dart';
import 'package:weather/app/network/api_client.dart';
import 'package:weather/app/repositories/weather_repository.dart';
import 'package:weather/app/translations/locale_keys.g.dart';
import 'package:weather/app/widgets/app_loader.dart';
import 'package:weather/app/widgets/weather_card.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherCubit(
        weatherRepository: WeatherRepository(
          apiClient: ApiClient(
            httpClient: Dio(),
            baseUrl: apiClientBaseUrl,
          ),
          sharedPreferences: AppSharedPreferences.instance,
        ),
      )..fetchWeather(),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.appName.tr(),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<WeatherCubit>().fetchWeather(),
          ),
        ],
      ),
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (BuildContext context, state) {
          if (state is WeatherLoadError) {
            final snackbar = SnackBar(
              content: Text(state.error),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
        },
        builder: (BuildContext context, state) {
          final groupedWeatherList = state.groupedWeatherList;

          return AppLoader(
            isLoading: state is WeatherLoading,
            child: ListView.builder(
              itemCount: groupedWeatherList.length,
              itemBuilder: (context, index) {
                final dailyWeather = groupedWeatherList[index] as List<Weather>;

                return Builder(
                  builder: (snapshot) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 16,
                      ),
                      child: WeatherCard(dailyWeatherList: dailyWeather),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

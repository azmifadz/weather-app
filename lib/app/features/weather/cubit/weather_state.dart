part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState({required this.weatherResponseData});

  final WeatherResponseData? weatherResponseData;

  List<dynamic> get groupedWeatherList {
    if (weatherResponseData == null) {
      return [];
    }

    final groupedList = <dynamic>[];

    groupBy(
      weatherResponseData!.list,
      (obj) => toDateTime(obj.date),
    ).forEach((key, value) {
      groupedList.add(value);
    });

    return groupedList;
  }

  @override
  List<Object?> get props => [weatherResponseData];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial() : super(weatherResponseData: null);

  @override
  List<Object?> get props => [...super.props];
}

class WeatherLoading extends WeatherState {
  const WeatherLoading({
    WeatherResponseData? data,
  }) : super(weatherResponseData: data);

  @override
  List<Object?> get props => [...super.props];
}

class WeatherEmpty extends WeatherState {
  const WeatherEmpty({
    WeatherResponseData? data,
  }) : super(weatherResponseData: data);

  @override
  List<Object?> get props => [...super.props];
}

class WeatherLoadSuccess extends WeatherState {
  const WeatherLoadSuccess({
    required WeatherResponseData data,
  }) : super(weatherResponseData: data);

  @override
  List<Object?> get props => [...super.props];
}

class WeatherLoadError extends WeatherState {
  const WeatherLoadError({
    required this.error,
    WeatherResponseData? data,
  }) : super(weatherResponseData: data);

  final String error;

  @override
  List<Object?> get props => [error, ...super.props];
}

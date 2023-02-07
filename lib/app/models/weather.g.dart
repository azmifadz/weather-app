// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponseData _$WeatherResponseDataFromJson(Map<String, dynamic> json) =>
    WeatherResponseData(
      list: (json['list'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherResponseDataToJson(
        WeatherResponseData instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      date: json['dt'] as int,
      main: WeatherMain.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
      dateText: json['dt_txt'] as String,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'dt': instance.date,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'dt_txt': instance.dateText,
    };

WeatherMain _$WeatherMainFromJson(Map<String, dynamic> json) => WeatherMain(
      temp: (json['temp'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: (json['pressure'] as num).toDouble(),
      seaLevel: (json['sea_level'] as num).toDouble(),
      groundLevel: (json['grnd_level'] as num).toDouble(),
      humidity: json['humidity'] as int,
      tempKf: (json['temp_kf'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherMainToJson(WeatherMain instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'sea_level': instance.seaLevel,
      'grnd_level': instance.groundLevel,
      'humidity': instance.humidity,
      'temp_kf': instance.tempKf,
    };

WeatherDetail _$WeatherDetailFromJson(Map<String, dynamic> json) =>
    WeatherDetail(
      id: json['id'] as int,
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherDetailToJson(WeatherDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

Clouds _$CloudsFromJson(Map<String, dynamic> json) => Clouds(
      all: json['all'] as int,
    );

Map<String, dynamic> _$CloudsToJson(Clouds instance) => <String, dynamic>{
      'all': instance.all,
    };

Wind _$WindFromJson(Map<String, dynamic> json) => Wind(
      speed: (json['speed'] as num).toDouble(),
      deg: (json['deg'] as num).toDouble(),
    );

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };

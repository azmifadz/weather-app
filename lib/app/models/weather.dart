import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class WeatherResponseData {
  const WeatherResponseData({
    required this.list,
  });

  factory WeatherResponseData.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseDataFromJson(json);

  final List<Weather> list;

  Map<String, dynamic> toJson() => _$WeatherResponseDataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Weather {
  const Weather({
    required this.date,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.dateText,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  @JsonKey(name: 'dt')
  final int date;
  final WeatherMain main;
  final List<WeatherDetail> weather;
  final Clouds clouds;
  final Wind wind;
  @JsonKey(name: 'dt_txt')
  final String dateText;

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherMain {
  WeatherMain({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.groundLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory WeatherMain.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainFromJson(json);

  final double temp;
  final double tempMin;
  final double tempMax;
  final double pressure;
  final double seaLevel;
  @JsonKey(name: 'grnd_level')
  final double groundLevel;
  final int humidity;
  final double tempKf;

  Map<String, dynamic> toJson() => _$WeatherMainToJson(this);
}

@JsonSerializable()
class WeatherDetail {
  WeatherDetail({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDetail.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailFromJson(json);

  final int id;
  final String main;
  final String description;
  final String icon;

  Map<String, dynamic> toJson() => _$WeatherDetailToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Clouds {
  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

  final int all;

  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Wind {
  Wind({
    required this.speed,
    required this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  final double speed;
  final double deg;

  Map<String, dynamic> toJson() => _$WindToJson(this);
}

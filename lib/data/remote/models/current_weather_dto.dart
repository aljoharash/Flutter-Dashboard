import 'package:json_annotation/json_annotation.dart';
part 'current_weather_dto.g.dart';

@JsonSerializable()
class CurrentWeatherDTO {
  final String name;
  final _MainDTO main;
  final List<_WeatherDTO> weather;

  CurrentWeatherDTO({
    required this.name,
    required this.main,
    required this.weather,
  });

  factory CurrentWeatherDTO.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherDTOToJson(this);
}

@JsonSerializable()
class _MainDTO {
  final double temp;
  final int humidity;

  _MainDTO({
    required this.temp,
    required this.humidity,
  });

  factory _MainDTO.fromJson(Map<String, dynamic> json) =>
      _$MainDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MainDTOToJson(this);
}

@JsonSerializable()
class _WeatherDTO {
  final String main;        
  final String description; 

  _WeatherDTO({
    required this.main,
    required this.description,
  });

  factory _WeatherDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherDTOFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDTOToJson(this);
}

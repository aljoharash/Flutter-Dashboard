// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherDTO _$CurrentWeatherDTOFromJson(Map<String, dynamic> json) =>
    CurrentWeatherDTO(
      name: json['name'] as String,
      main: _MainDTO.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => _WeatherDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurrentWeatherDTOToJson(CurrentWeatherDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'main': instance.main,
      'weather': instance.weather,
    };

_MainDTO _$MainDTOFromJson(Map<String, dynamic> json) => _MainDTO(
  temp: (json['temp'] as num).toDouble(),
  humidity: (json['humidity'] as num).toInt(),
);

Map<String, dynamic> _$MainDTOToJson(_MainDTO instance) => <String, dynamic>{
  'temp': instance.temp,
  'humidity': instance.humidity,
};

_WeatherDTO _$WeatherDTOFromJson(Map<String, dynamic> json) => _WeatherDTO(
  main: json['main'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$WeatherDTOToJson(_WeatherDTO instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
    };

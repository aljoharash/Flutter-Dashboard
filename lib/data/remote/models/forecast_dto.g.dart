// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDTO _$ForecastDTOFromJson(Map<String, dynamic> json) => ForecastDTO(
  list: (json['list'] as List<dynamic>)
      .map((e) => ForecastItemDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ForecastDTOToJson(ForecastDTO instance) =>
    <String, dynamic>{'list': instance.list};

ForecastItemDTO _$ForecastItemDTOFromJson(Map<String, dynamic> json) =>
    ForecastItemDTO(
      dt: (json['dt'] as num).toInt(),
      main: _MainDTO.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => _WeatherDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      rain: json['rain'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ForecastItemDTOToJson(ForecastItemDTO instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'rain': instance.rain,
    };

_MainDTO _$MainDTOFromJson(Map<String, dynamic> json) =>
    _MainDTO(temp: (json['temp'] as num).toDouble());

Map<String, dynamic> _$MainDTOToJson(_MainDTO instance) => <String, dynamic>{
  'temp': instance.temp,
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

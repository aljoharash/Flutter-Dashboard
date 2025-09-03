import 'package:json_annotation/json_annotation.dart';
part 'forecast_dto.g.dart';

@JsonSerializable()
class ForecastDTO {
  final List<ForecastItemDTO> list;

  ForecastDTO({required this.list});

  factory ForecastDTO.fromJson(Map<String, dynamic> json) =>
      _$ForecastDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastDTOToJson(this);
}

@JsonSerializable()
class ForecastItemDTO {
  final int dt;                       
  final _MainDTO main;                
  final List<_WeatherDTO> weather;    
  final Map<String, dynamic>? rain;   

  ForecastItemDTO({
    required this.dt,
    required this.main,
    required this.weather,
    this.rain,
  });

  factory ForecastItemDTO.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastItemDTOToJson(this);
}

@JsonSerializable()
class _MainDTO {
  final double temp;

  _MainDTO({required this.temp});

  factory _MainDTO.fromJson(Map<String, dynamic> json) =>
      _$MainDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MainDTOToJson(this);
}

@JsonSerializable()
class _WeatherDTO {
  final String main;
  final String description;

  _WeatherDTO({required this.main, required this.description});

  factory _WeatherDTO.fromJson(Map<String, dynamic> json) =>
      _$WeatherDTOFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDTOToJson(this);
}

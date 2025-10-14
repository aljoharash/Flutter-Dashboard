import 'package:dio/dio.dart';
import 'package:flutter_start_kit/common/constant.dart';
import 'models/current_weather_dto.dart';
import 'models/forecast_dto.dart';
import 'services/weather_api_client.dart';

/// The `WeatherRemoteDataSourceImpl` class implements the `WeatherRemoteDataSource` abstract class to
/// interact with a weather API using Dio in Dart.
abstract class WeatherRemoteDataSource {
  Future<CurrentWeatherDTO> getCurrentWeather(String city);
  Future<ForecastDTO> getFiveDayForecast(String city);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final WeatherApiClient api;

  WeatherRemoteDataSourceImpl(Dio dio)
    : api = WeatherApiClient(
        dio..options = BaseOptions(baseUrl: ApiConstants.baseUrl),
        baseUrl: ApiConstants.baseUrl,
      );

  @override
  Future<CurrentWeatherDTO> getCurrentWeather(String city) =>
      api.getCurrentWeather(city, ApiConstants.apiKey);

  @override
  Future<ForecastDTO> getFiveDayForecast(String city) =>
      api.getFiveDayForecast(city, ApiConstants.apiKey);
}

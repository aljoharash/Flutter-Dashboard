import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_start_kit/common/constant.dart';
import '../models/current_weather_dto.dart';
import '../models/forecast_dto.dart';

part 'weather_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class WeatherApiClient {
  factory WeatherApiClient(Dio dio, {String baseUrl}) = _WeatherApiClient;


  @GET("/weather")
  Future<CurrentWeatherDTO> getCurrentWeather(
    @Query("q") String city,
    @Query("appid") String apiKey, {
    @Query("units") String units = "metric",
  });

  @GET("/forecast")
  Future<ForecastDTO> getFiveDayForecast(
    @Query("q") String city,
    @Query("appid") String apiKey, {
    @Query("units") String units = "metric",
  });
}

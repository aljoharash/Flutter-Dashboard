import '../model/weather_entity.dart';
import '../model/series_highs_entity.dart';
import '../model/series_rain_entity.dart';
import '../model/condition_share_entity.dart';

abstract class DashboardRepository {
  Future<WeatherEntity> fetchCurrentWeather(String city);
  Future<FiveDayHighsEntity> fetchFiveDayHighs(String city);
  Future<FiveDayRainEntity>  fetchFiveDayRain(String city);
  Future<ConditionShareEntity> fetchConditionShare(String city);
}

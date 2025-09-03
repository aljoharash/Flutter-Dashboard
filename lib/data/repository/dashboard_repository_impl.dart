import 'package:flutter_start_kit/data/util/resource.dart';
import 'package:intl/intl.dart';

import '../../domain/model/weather_entity.dart';
import '../../domain/model/series_highs_entity.dart';
import '../../domain/model/series_rain_entity.dart';
import '../../domain/model/condition_share_entity.dart';
import '../../domain/repository/dashboard_repository.dart';

import '../remote/weather_remote_data_source.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final WeatherRemoteDataSource remote;

  DashboardRepositoryImpl({required this.remote});

  @override
  Future<WeatherEntity> fetchCurrentWeather(String city) async {
    final dto = await remote.getCurrentWeather(city);

    final condition = dto.weather.isNotEmpty ? dto.weather.first.main : 'N/A';
    final description = dto.weather.isNotEmpty ? dto.weather.first.description : 'N/A';

    return WeatherEntity(
      city: dto.name,
      temperatureC: dto.main.temp,
      humidity: dto.main.humidity,
      condition: condition,
      description: description,
    );
  }


  @override
  Future<FiveDayHighsEntity> fetchFiveDayHighs(String city) async {
    final fc = await remote.getFiveDayForecast(city);

    final Map<String, double> dailyMax = {};

    for (final item in fc.list) {
      final dtLocal =
          DateTime.fromMillisecondsSinceEpoch(item.dt * 1000, isUtc: true).toLocal();
      final key = DateFormat('yyyy-MM-dd').format(dtLocal);
      final temp = item.main.temp;

      dailyMax.update(
        key,
        (prev) => temp > prev ? temp : prev,
        ifAbsent: () => temp,
      );
    }

    final orderedKeys = dailyMax.keys.toList()..sort();
    final days = orderedKeys.take(5).map(DateTime.parse).toList();
    final highs = orderedKeys.take(5).map((k) => dailyMax[k]!).toList();

    return FiveDayHighsEntity(city: city, days: days, highsC: highs);
  }

  
  @override
  Future<FiveDayRainEntity> fetchFiveDayRain(String city) async {
    final fc = await remote.getFiveDayForecast(city);

    final Map<String, double> dailySum = {};

    for (final item in fc.list) {
      final dtLocal =
          DateTime.fromMillisecondsSinceEpoch(item.dt * 1000, isUtc: true).toLocal();
      final key = DateFormat('yyyy-MM-dd').format(dtLocal);

      final mm = (item.rain?['3h'] ?? item.rain?['1h'] ?? 0.0) * 1.0;

      dailySum.update(
        key,
        (prev) => prev + mm,
        ifAbsent: () => mm,
      );
    }

    final orderedKeys = dailySum.keys.toList()..sort();
    final days = orderedKeys.take(5).map(DateTime.parse).toList();
    final totals = orderedKeys.take(5).map((k) => dailySum[k]!).toList();

    return FiveDayRainEntity(city: city, days: days, rainMm: totals);
  }


  @override
  Future<ConditionShareEntity> fetchConditionShare(String city) async {
    final fc = await remote.getFiveDayForecast(city);

    // label -> count
    final Map<String, int> counts = {};

    for (final item in fc.list) {
      final label = item.weather.isNotEmpty ? item.weather.first.main : 'Unknown';
      counts.update(label, (v) => v + 1, ifAbsent: () => 1);
    }

    final labels = counts.keys.toList();
    final values = labels.map((k) => counts[k]!.toDouble()).toList();

    return ConditionShareEntity(city: city, labels: labels, values: values);
  }

  Future<Resource<WeatherEntity>> fetchCurrentWeatherSafe(String city) async {
  try {
    final dto = await remote.getCurrentWeather(city);
    final entity = WeatherEntity(
      city: dto.name,
      temperatureC: dto.main.temp,
      humidity: dto.main.humidity,
      condition: dto.weather.first.main,
      description: dto.weather.first.description,
    );
    return Success(entity);
  } catch (e) {
    return Failure(exception: e is Exception ? e : Exception(e.toString()));
  }
}

}

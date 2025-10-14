import 'package:equatable/equatable.dart';
import '../../domain/model/weather_entity.dart';
import '../../domain/model/series_highs_entity.dart';
import '../../domain/model/series_rain_entity.dart';
import '../../domain/model/condition_share_entity.dart';

/// The `DashboardState` class is an abstract class in Dart that extends `Equatable` and has an empty
/// `props` list.
abstract class DashboardState extends Equatable {
  const DashboardState();
  @override
  List<Object?> get props => [];
}

/// The class `DashboardInitial` is a subclass of `DashboardState` in Dart.
class DashboardInitial extends DashboardState {}

/// The class `DashboardLoading` is a subclass of `DashboardState` in Dart.
class DashboardLoading extends DashboardState {}

/// The `DashboardError` class in Dart represents an error state for a dashboard with a message
/// property.
class DashboardError extends DashboardState {
  final String message;
  const DashboardError(this.message);
  @override
  List<Object?> get props => [message];
}

/// The `DashboardLoaded` class represents the state of a dashboard with weather data in a Dart
/// application.
class DashboardLoaded extends DashboardState {
  final WeatherEntity weather;
  const DashboardLoaded(this.weather);
  @override
  List<Object?> get props => [weather];
}

/// The `FiveDayHighsLoaded` class represents the state of a dashboard with loaded five-day highs data.
class FiveDayHighsLoading extends DashboardState {}
class FiveDayHighsLoaded extends DashboardState {
  final FiveDayHighsEntity data;
  const FiveDayHighsLoaded(this.data);
  @override
  List<Object?> get props => [data];
}

/// The class `FiveDayRainLoaded` represents the state of a dashboard with loaded data for a five-day
/// rain forecast.
class FiveDayRainLoading extends DashboardState {}
class FiveDayRainLoaded extends DashboardState {
  final FiveDayRainEntity data;
  const FiveDayRainLoaded(this.data);
  @override
  List<Object?> get props => [data];
}

/// The below class represents the state of a dashboard with condition share data, including loading and
/// loaded states with associated entity data.
class ConditionShareLoading extends DashboardState {}
class ConditionShareLoaded extends DashboardState {
  final ConditionShareEntity data;
  const ConditionShareLoaded(this.data);
  @override
  List<Object?> get props => [data];
}

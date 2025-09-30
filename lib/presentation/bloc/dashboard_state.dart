import 'package:equatable/equatable.dart';
import '../../domain/model/weather_entity.dart';
import '../../domain/model/series_highs_entity.dart';
import '../../domain/model/series_rain_entity.dart';
import '../../domain/model/condition_share_entity.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardError extends DashboardState {
  final String message;
  const DashboardError(this.message);
  @override
  List<Object?> get props => [message];
}

class DashboardLoaded extends DashboardState {
  final WeatherEntity weather;
  const DashboardLoaded(this.weather);
  @override
  List<Object?> get props => [weather];
}

class FiveDayHighsLoading extends DashboardState {}
class FiveDayHighsLoaded extends DashboardState {
  final FiveDayHighsEntity data;
  const FiveDayHighsLoaded(this.data);
  @override
  List<Object?> get props => [data];
}

class FiveDayRainLoading extends DashboardState {}
class FiveDayRainLoaded extends DashboardState {
  final FiveDayRainEntity data;
  const FiveDayRainLoaded(this.data);
  @override
  List<Object?> get props => [data];
}

class ConditionShareLoading extends DashboardState {}
class ConditionShareLoaded extends DashboardState {
  final ConditionShareEntity data;
  const ConditionShareLoaded(this.data);
  @override
  List<Object?> get props => [data];
}

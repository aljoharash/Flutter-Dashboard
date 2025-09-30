import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
  @override
  List<Object?> get props => [];
}

class DashboardRequested extends DashboardEvent {
  final String city;
  const DashboardRequested(this.city);
  @override
  List<Object?> get props => [city];
}

class FiveDayHighsRequested extends DashboardEvent {
  final String city;
  const FiveDayHighsRequested(this.city);
  @override
  List<Object?> get props => [city];
}

class FiveDayRainRequested extends DashboardEvent {
  final String city;
  const FiveDayRainRequested(this.city);
  @override
  List<Object?> get props => [city];
}

class ConditionShareRequested extends DashboardEvent {
  final String city;
  const ConditionShareRequested(this.city);
  @override
  List<Object?> get props => [city];
}

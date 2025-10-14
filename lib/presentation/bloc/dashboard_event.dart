import 'package:equatable/equatable.dart';

/// The above Dart class defines an abstract class named DashboardEvent that extends Equatable and has
/// an empty props list override.
abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
  @override
  List<Object?> get props => [];
}

/// The `DashboardRequested` class in Dart represents an event where a dashboard is requested for a
/// specific city.
class DashboardRequested extends DashboardEvent {
  final String city;
  const DashboardRequested(this.city);
  @override
  List<Object?> get props => [city];
}

/// The `FiveDayHighsRequested` class in Dart represents an event where five-day highs are requested for
/// a specific city.
class FiveDayHighsRequested extends DashboardEvent {
  final String city;
  const FiveDayHighsRequested(this.city);
  @override
  List<Object?> get props => [city];
}

/// The `FiveDayRainRequested` class in Dart represents an event where the user requests five-day rain
/// forecast data for a specific city.
class FiveDayRainRequested extends DashboardEvent {
  final String city;
  const FiveDayRainRequested(this.city);
  @override
  List<Object?> get props => [city];
}

/// The class `ConditionShareRequested` represents an event where sharing conditions is requested for a
/// specific city in Dart programming language.
class ConditionShareRequested extends DashboardEvent {
  final String city;
  const ConditionShareRequested(this.city);
  @override
  List<Object?> get props => [city];
}

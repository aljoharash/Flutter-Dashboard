import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

import '../../domain/usecase/get_dashboard_weather_usecase.dart';
import '../../domain/usecase/get_five_day_highs_usecase.dart';
import '../../domain/usecase/get_five_day_rain_usecase.dart';
import '../../domain/usecase/get_condition_share_usecase.dart';

/// The `DashboardBloc` class in Dart is responsible for managing the state and handling events related
/// to fetching weather data, five-day highs, rain information, and condition sharing.
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardWeatherUseCase getWeather;
  final GetFiveDayHighsUseCase getHighs;
  final GetFiveDayRainUseCase getRain;
  final GetConditionShareUseCase getShare;

/// The DashboardBloc constructor initializes with functions for getting weather, highs, rain, and share
/// data, and sets initial state to DashboardInitial.
  DashboardBloc({
    required this.getWeather,
    required this.getHighs,
    required this.getRain,
    required this.getShare,
  }) : super(DashboardInitial()) {
    on<DashboardRequested>(_onWeatherRequested);
    on<FiveDayHighsRequested>(_onHighsRequested);
    on<FiveDayRainRequested>(_onRainRequested);
    on<ConditionShareRequested>(_onConditionShareRequested);
  }

  /// The function `_onWeatherRequested` handles weather data retrieval for a specific city and updates
  /// the dashboard state accordingly.
  Future<void> _onWeatherRequested(
    DashboardRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading());
    try {
      final weather = await getWeather.execute(event.city);
      emit(DashboardLoaded(weather));
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }

/// The function `_onHighsRequested` fetches five-day high temperature data for a specified city and
/// updates the dashboard state accordingly.
  Future<void> _onHighsRequested(
    FiveDayHighsRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(FiveDayHighsLoading());
    try {
      final data = await getHighs.execute(event.city);
      emit(FiveDayHighsLoaded(data));
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }

/// This Dart function handles a request for five-day rain data, loading the data if successful and
/// emitting an error if there is an exception.
  Future<void> _onRainRequested(
    FiveDayRainRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(FiveDayRainLoading());
    try {
      final data = await getRain.execute(event.city);
      emit(FiveDayRainLoaded(data));
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }

/// The function `_onConditionShareRequested` handles the sharing of condition data for a specific city,
/// updating the dashboard state accordingly.
  Future<void> _onConditionShareRequested(
    ConditionShareRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(ConditionShareLoading());
    try {
      final data = await getShare.execute(event.city);
      emit(ConditionShareLoaded(data));
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }
}

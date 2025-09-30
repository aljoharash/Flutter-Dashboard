import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

import '../../domain/usecase/get_dashboard_weather_usecase.dart';
import '../../domain/usecase/get_five_day_highs_usecase.dart';
import '../../domain/usecase/get_five_day_rain_usecase.dart';
import '../../domain/usecase/get_condition_share_usecase.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardWeatherUseCase getWeather;
  final GetFiveDayHighsUseCase getHighs;
  final GetFiveDayRainUseCase getRain;
  final GetConditionShareUseCase getShare;

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

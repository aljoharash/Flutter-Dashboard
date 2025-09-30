import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start_kit/common/app_theme.dart';
import 'package:flutter_start_kit/data/remote/weather_remote_data_source.dart';
import 'package:flutter_start_kit/data/repository/dashboard_repository_impl.dart';
import 'package:flutter_start_kit/domain/repository/dashboard_repository.dart';
import 'package:flutter_start_kit/domain/usecase/get_condition_share_usecase.dart';
import 'package:flutter_start_kit/domain/usecase/get_dashboard_weather_usecase.dart';
import 'package:flutter_start_kit/domain/usecase/get_five_day_highs_usecase.dart';
import 'package:flutter_start_kit/domain/usecase/get_five_day_rain_usecase.dart';
import 'package:flutter_start_kit/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter_start_kit/presentation/pages/dashboard_page.dart';
import 'common/constant.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  final remote = WeatherRemoteDataSourceImpl(dio);
  final DashboardRepository repo = DashboardRepositoryImpl(remote: remote);

  runApp(MaterialApp(
    title: 'Dashboard',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.dark(),
    home: BlocProvider(
      create: (_) => DashboardBloc(
        getWeather: GetDashboardWeatherUseCase(repo),
        getHighs: GetFiveDayHighsUseCase(repo),
        getRain: GetFiveDayRainUseCase(repo),
        getShare: GetConditionShareUseCase(repo),
      ),
      child: const DashboardPage(),
    ),
  ));
}

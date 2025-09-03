import '../model/weather_entity.dart';
import '../repository/dashboard_repository.dart';

class GetDashboardWeatherUseCase {
  final DashboardRepository repository;
  GetDashboardWeatherUseCase(this.repository);
  Future<WeatherEntity> execute(String city) => repository.fetchCurrentWeather(city);
}

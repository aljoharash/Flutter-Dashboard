import '../model/weather_entity.dart';
import '../repository/dashboard_repository.dart';

/// The GetDashboardWeatherUseCase class fetches the current weather for a specified city using a
/// DashboardRepository.
class GetDashboardWeatherUseCase {
  final DashboardRepository repository;
  GetDashboardWeatherUseCase(this.repository);
  Future<WeatherEntity> execute(String city) => repository.fetchCurrentWeather(city);
}

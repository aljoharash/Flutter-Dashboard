import '../model/series_rain_entity.dart';
import '../repository/dashboard_repository.dart';

/// The GetFiveDayRainUseCase class fetches five-day rain forecast data for a specific city using a
/// DashboardRepository.
class GetFiveDayRainUseCase {
  final DashboardRepository repo;
  GetFiveDayRainUseCase(this.repo);
  Future<FiveDayRainEntity> execute(String city) => repo.fetchFiveDayRain(city);
}

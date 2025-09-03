import '../model/series_rain_entity.dart';
import '../repository/dashboard_repository.dart';

class GetFiveDayRainUseCase {
  final DashboardRepository repo;
  GetFiveDayRainUseCase(this.repo);
  Future<FiveDayRainEntity> execute(String city) => repo.fetchFiveDayRain(city);
}

import '../model/series_highs_entity.dart';
import '../repository/dashboard_repository.dart';

class GetFiveDayHighsUseCase {
  final DashboardRepository repo;
  GetFiveDayHighsUseCase(this.repo);
  Future<FiveDayHighsEntity> execute(String city) => repo.fetchFiveDayHighs(city);
}

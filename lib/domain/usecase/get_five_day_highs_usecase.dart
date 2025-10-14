import '../model/series_highs_entity.dart';
import '../repository/dashboard_repository.dart';

/// This Dart class represents a use case for fetching five-day highs for a specific city using a
/// DashboardRepository.
class GetFiveDayHighsUseCase {
  final DashboardRepository repo;
  GetFiveDayHighsUseCase(this.repo);
  Future<FiveDayHighsEntity> execute(String city) => repo.fetchFiveDayHighs(city);
}

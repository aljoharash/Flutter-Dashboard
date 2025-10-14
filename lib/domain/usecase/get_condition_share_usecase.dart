import '../model/condition_share_entity.dart';
import '../repository/dashboard_repository.dart';

/// The GetConditionShareUseCase class fetches and returns the condition share entity for a specified
/// city using data from the DashboardRepository.
class GetConditionShareUseCase {
  final DashboardRepository repo;
  GetConditionShareUseCase(this.repo);
  Future<ConditionShareEntity> execute(String city) => repo.fetchConditionShare(city);
}

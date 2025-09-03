import '../model/condition_share_entity.dart';
import '../repository/dashboard_repository.dart';

class GetConditionShareUseCase {
  final DashboardRepository repo;
  GetConditionShareUseCase(this.repo);
  Future<ConditionShareEntity> execute(String city) => repo.fetchConditionShare(city);
}

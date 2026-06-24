import '../../domain/repository/dashboard_repository.dart';
import '../model/dashboard_model.dart';

class DashboardRepositoryImpl
    implements DashboardRepository {

  @override
  Future<DashboardModel> getDashboard() async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return DashboardModel(
      totalRequests: 15,
      pendingApprovals: 4,
      assets: 3,
      orders: 10,
    );
  }
}
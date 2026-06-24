import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/state_status.dart';
import '../../data/repository/dashboard_repository_impl.dart';
import 'dashboard_state.dart';

final dashboardProvider =
NotifierProvider<
    DashboardNotifier,
    DashboardState>(
  DashboardNotifier.new,
);

class DashboardNotifier
    extends Notifier<DashboardState> {

  @override
  DashboardState build() {

    Future.microtask(
          () => loadDashboard(),
    );

    return const DashboardState();
  }

  Future<void> loadDashboard() async {

    state = state.copyWith(
      status: StateStatus.loading,
    );

    try {

      final dashboard =
      await DashboardRepositoryImpl()
          .getDashboard();

      state = state.copyWith(
        status: StateStatus.success,
        dashboard: dashboard,
      );

    } catch (e) {

      state = state.copyWith(
        status: StateStatus.error,
        error: e.toString(),
      );
    }
  }
}
import 'package:corporate_procurement/features/dashboard/data/model/dashboard_model.dart';

import '../../../../core/utils/state_status.dart';

class DashboardState {
  final StateStatus status;
  final DashboardModel? dashboard;
  final String? error;

  const DashboardState({
    this.status = StateStatus.initial,
    this.dashboard,
    this.error,
  });

  DashboardState copyWith({
    StateStatus? status,
    DashboardModel? dashboard,
    String? error,
  }) {
    return DashboardState(
      status: status ?? this.status,
      dashboard: dashboard ?? this.dashboard,
      error: error,
    );
  }
}
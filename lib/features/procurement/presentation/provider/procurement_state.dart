import '../../../../core/utils/state_status.dart';
import '../../data/models/request_model.dart';

class ProcurementState {
  final StateStatus status;
  final List<RequestModel> requests;
  final String? error;

  const ProcurementState({
    this.status = StateStatus.initial,
    this.requests = const [],
    this.error,
  });

  ProcurementState copyWith({
    StateStatus? status,
    List<RequestModel>? requests,
    String? error,
  }) {
    return ProcurementState(
      status: status ?? this.status,
      requests: requests ?? this.requests,
      error: error,
    );
  }
}
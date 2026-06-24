import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../core/storage/hive_boxes.dart';
import '../../../../core/utils/state_status.dart';
import '../../data/models/request_model.dart';

final procurementProvider =
    NotifierProvider<ProcurementNotifier, ProcurementState>(
      ProcurementNotifier.new,
    );

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

class ProcurementNotifier extends Notifier<ProcurementState> {
  @override
  @override
  ProcurementState build() {

    final box = Hive.box(
      HiveBoxes.requests,
    );

    final data =
    box.values.toList();

    final requests = data
        .map(
          (e) => RequestModel.fromJson(
        Map<String,dynamic>.from(e),
      ),
    )
        .toList();

    return ProcurementState(
      requests: requests,
    );
  }

  Future<void> createRequest(
      RequestModel request,
      ) async {

    final box = Hive.box(
      HiveBoxes.requests,
    );

    print("Hive Count => ${box.length}");
    print("Hive Data => ${box.values.toList()}");

    await box.add(
      request.toJson(),
    );

    state = state.copyWith(
      requests: [
        ...state.requests,
        request,
      ],
    );
  }
}

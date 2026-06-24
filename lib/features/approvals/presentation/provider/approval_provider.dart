import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../core/storage/hive_boxes.dart';
import '../../../../core/utils/state_status.dart';
import '../../../procurement/data/models/request_model.dart';
import '../../data/model/approval_model.dart';

final approvalProvider = NotifierProvider<ApprovalNotifier, ApprovalState>(
  ApprovalNotifier.new,
);

class ApprovalState {
  final StateStatus status;
  final List<ApprovalModel> approvals;
  final String? error;

  const ApprovalState({
    this.status = StateStatus.initial,
    this.approvals = const [],
    this.error,
  });

  ApprovalState copyWith({
    StateStatus? status,
    List<ApprovalModel>? approvals,
    String? error,
  }) {
    return ApprovalState(
      status: status ?? this.status,
      approvals: approvals ?? this.approvals,
      error: error,
    );
  }
}

class ApprovalNotifier extends Notifier<ApprovalState> {
  @override
  ApprovalState build() {
    final box = Hive.box(HiveBoxes.approvals);

    final approvals = box.values.map((e) {
      final data = Map<String, dynamic>.from(e);

      return ApprovalModel(
        id: data['id'],
        requestId: data['requestId'],
        employeeName: data['employeeName'],
        productName: data['productName'],
        status: data['status'],
      );
    }).toList();

    return ApprovalState(approvals: approvals);
  }

  Future<void> approveRequest(String id) async {
    final updated = state.approvals.map((item) {
      if (item.id == id) {
        return item.copyWith(status: 'Approved');
      }

      return item;
    }).toList();

    state = state.copyWith(approvals: updated);

    final box = Hive.box(HiveBoxes.approvals);

    await box.clear();

    for (final approval in updated) {
      await box.add({
        'id': approval.id,
        'requestId': approval.requestId,
        'employeeName': approval.employeeName,
        'productName': approval.productName,
        'status': approval.status,
      });
    }
  }

  Future<void> rejectRequest(String id) async {
    final updated = state.approvals.map((item) {
      if (item.id == id) {
        return item.copyWith(status: 'Rejected');
      }

      return item;
    }).toList();

    state = state.copyWith(approvals: updated);

    final box = Hive.box(HiveBoxes.approvals);

    await box.clear();

    for (final approval in updated) {
      await box.add({
        'id': approval.id,
        'requestId': approval.requestId,
        'employeeName': approval.employeeName,
        'productName': approval.productName,
        'status': approval.status,
      });
    }
  }

  Future<void> addApproval(RequestModel request) async {
    final approval = ApprovalModel(
      id: request.id,
      requestId: request.id,
      employeeName: 'Employee',
      productName: request.productName,
      status: 'Pending',
    );

    final box = Hive.box(HiveBoxes.approvals);

    await box.add({
      'id': approval.id,
      'requestId': approval.requestId,
      'employeeName': approval.employeeName,
      'productName': approval.productName,
      'status': approval.status,
    });

    state = state.copyWith(approvals: [...state.approvals, approval]);
  }
}

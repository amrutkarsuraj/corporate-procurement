class ApprovalModel {
  final String id;
  final String requestId;
  final String employeeName;
  final String productName;
  final String status;

  const ApprovalModel({
    required this.id,
    required this.requestId,
    required this.employeeName,
    required this.productName,
    required this.status,
  });

  ApprovalModel copyWith({
    String? status,
  }) {
    return ApprovalModel(
      id: id,
      requestId: requestId,
      employeeName: employeeName,
      productName: productName,
      status: status ?? this.status,
    );
  }
}
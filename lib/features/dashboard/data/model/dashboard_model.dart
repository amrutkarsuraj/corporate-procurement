class DashboardModel {
  final int totalRequests;
  final int pendingApprovals;
  final int assets;
  final int orders;

  DashboardModel({
    required this.totalRequests,
    required this.pendingApprovals,
    required this.assets,
    required this.orders,
  });

  factory DashboardModel.fromJson(
      Map<String, dynamic> json) {
    return DashboardModel(
      totalRequests:
      json['totalRequests'] ?? 0,
      pendingApprovals:
      json['pendingApprovals'] ?? 0,
      assets:
      json['assets'] ?? 0,
      orders:
      json['orders'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalRequests': totalRequests,
      'pendingApprovals': pendingApprovals,
      'assets': assets,
      'orders': orders,
    };
  }
}
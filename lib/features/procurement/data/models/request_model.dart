class RequestModel {
  final String id;
  final String productName;
  final String category;
  final int quantity;
  final String priority;
  final String status;
  final String justification;

  const RequestModel({
    required this.id,
    required this.productName,
    required this.category,
    required this.quantity,
    required this.priority,
    required this.status,
    required this.justification,
  });

  factory RequestModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return RequestModel(
      id: json['id'],
      productName: json['productName'],
      category: json['category'],
      quantity: json['quantity'],
      priority: json['priority'],
      status: json['status'],
      justification: json['justification'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'category': category,
      'quantity': quantity,
      'priority': priority,
      'status': status,
      'justification': justification,
    };
  }
}

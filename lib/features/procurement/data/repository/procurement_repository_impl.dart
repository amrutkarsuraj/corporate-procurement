import '../../domain/repository/procurement_repository.dart';
import '../models/request_model.dart';

class ProcurementRepositoryImpl
    implements ProcurementRepository {

  final List<RequestModel> _mockData = [
    RequestModel(
      id: 'REQ001',
      productName: 'MacBook Pro',
      category: 'Laptop',
      quantity: 1,
      priority: 'High',
      status: 'Pending',
      justification: 'Development Work',
    ),
  ];

  @override
  Future<List<RequestModel>>
  getRequests() async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return _mockData;
  }

  @override
  Future<void> createRequest(
      RequestModel request) async {

    _mockData.add(request);
  }
}
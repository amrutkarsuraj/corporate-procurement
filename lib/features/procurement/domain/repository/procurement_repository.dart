import '../../data/models/request_model.dart';

abstract class ProcurementRepository {

  Future<List<RequestModel>>
  getRequests();

  Future<void> createRequest(
      RequestModel request);
}
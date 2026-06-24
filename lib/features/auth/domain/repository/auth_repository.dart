import '../../data/models/login_request.dart';
import '../../data/models/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponseModel> login(
      LoginRequestModel request,
      );
}
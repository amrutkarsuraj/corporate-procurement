import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_remote_datasource.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';

class AuthRepositoryImpl
    implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(
      this.remoteDataSource,
      );

  @override
  Future<LoginResponseModel> login(
      LoginRequestModel request) async {
    return await remoteDataSource.login(
      request,
    );
  }
}
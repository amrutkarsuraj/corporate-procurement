import 'package:dio/dio.dart';

import '../datasource/auth_remote_datasource.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';


class AuthRemoteDataSourceImpl
    implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<LoginResponseModel> login(
      LoginRequestModel request) async {
    final response = await dio.post(
      '/auth/login',
      data: request.toJson(),
    );

    return LoginResponseModel.fromJson(
      response.data,
    );
  }
}
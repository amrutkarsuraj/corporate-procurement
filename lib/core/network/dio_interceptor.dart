import 'package:dio/dio.dart';

import '../storage/session_manager.dart';

class DioInterceptor
    extends Interceptor {

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {

    final token =
    SessionManager.getToken();

    if (token != null) {
      options.headers[
      'Authorization'] =
      'Bearer $token';
    }

    super.onRequest(
      options,
      handler,
    );
  }

  @override
  void onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) {

    if (err.response?.statusCode ==
        401) {

      /// refresh token api call
      /// logout user

    }

    super.onError(
      err,
      handler,
    );
  }
}
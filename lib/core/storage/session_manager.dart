import 'package:hive/hive.dart';

class SessionManager {
  static const _tokenKey =
      'access_token';

  static const _refreshTokenKey =
      'refresh_token';

  static Box get _box =>
      Hive.box('user_box');

  static Future<void> saveToken(
      String token,
      ) async {
    await _box.put(
      _tokenKey,
      token,
    );
  }

  static Future<void> saveRefreshToken(
      String token,
      ) async {
    await _box.put(
      _refreshTokenKey,
      token,
    );
  }

  static String? getToken() {
    return _box.get(
      _tokenKey,
    );
  }

  static String? getRefreshToken() {
    return _box.get(
      _refreshTokenKey,
    );
  }

  static bool isLoggedIn() {
    return getToken() != null;
  }

  static Future<void> logout() async {
    await _box.clear();
  }
}
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/mock_credentials.dart';
import '../../../../core/storage/session_manager.dart';
import '../../../../core/utils/state_status.dart';
import '../../data/models/login_request.dart';
import 'auth_dependencies.dart';
import 'auth_state.dart';

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return const AuthState();
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = state.copyWith(status: StateStatus.loading, errorMessage: null);

    await Future.delayed(const Duration(seconds: 1));

    final validUsers = [
      MockCredentials.employee,
      MockCredentials.manager,
      MockCredentials.finance,
      MockCredentials.procurement,
    ];

    if (validUsers.contains(username.trim().toLowerCase()) &&
        password.trim() == MockCredentials.password) {
      await SessionManager.saveToken("mock_token_$username");

      state = state.copyWith(status: StateStatus.success, isLoggedIn: true);
    } else {
      state = state.copyWith(
        status: StateStatus.error,
        isLoggedIn: false,
        errorMessage: "Invalid Username or Password",
      );
    }
  }

  Future<void> logout() async {
    await SessionManager.logout();

    state = const AuthState();
  }
}

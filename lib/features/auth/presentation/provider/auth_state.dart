import '../../../../core/utils/state_status.dart';

class AuthState {
  final StateStatus status;
  final bool isLoggedIn;
  final String? errorMessage;

  const AuthState({
    this.status = StateStatus.initial,
    this.isLoggedIn = false,
    this.errorMessage,
  });

  AuthState copyWith({
    StateStatus? status,
    bool? isLoggedIn,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      errorMessage: errorMessage,
    );
  }
}
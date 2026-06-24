class LoginResponseModel {
  final int id;
  final String username;
  final String email;
  final String accessToken;
  final String refreshToken;

  LoginResponseModel({
    required this.id,
    required this.username,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponseModel.fromJson(
      Map<String, dynamic> json) {
    return LoginResponseModel(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }
}
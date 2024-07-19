class TokenManager {
  static final TokenManager _instance = TokenManager._internal();
  String? _token;

  factory TokenManager() {
    return _instance;
  }

  TokenManager._internal();

  void setToken(String token) {
    _token = token;
  }

  String? getToken() {
    return _token;
  }
}

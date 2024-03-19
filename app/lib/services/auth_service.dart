class AuthService {
  static Future<bool> isUserAuthenticated() async {
    // fake auth verification
    await Future.delayed(const Duration(seconds: 5), () => null);
    return true;
  }
}

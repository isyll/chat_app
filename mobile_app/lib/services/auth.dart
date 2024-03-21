import 'package:chat_app/config/constants.dart';

class AuthService {
  static Future<bool> isUserAuthenticated() async {
    // fake auth verification
    await Future.delayed(
        const Duration(seconds: Constants.apiResponseDelay), () => null);
    return true;
  }
}

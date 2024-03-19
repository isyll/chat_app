import 'package:chat_app/config/constants.dart';

class ApiService {
  static final String cleanUrl = Constants.apiUrl.endsWith('/')
      ? Constants.apiUrl.substring(0, Constants.apiUrl.length - 1)
      : Constants.apiUrl;

}

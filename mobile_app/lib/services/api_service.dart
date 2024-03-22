import 'package:chat_app/config/constants.dart';
import 'package:chat_app/data/messages.dart';
import 'package:chat_app/models/latest_message.dart';

class ApiService {
  static final String cleanUrl = Constants.apiUrl.endsWith('/')
      ? Constants.apiUrl.substring(0, Constants.apiUrl.length - 1)
      : Constants.apiUrl;

  static Future<List<LatestMessageModel>> getLatestMessages() async {
    await Future.delayed(
        const Duration(seconds: Constants.apiResponseDelay), () => null);
    return MessagesData.latestMssages;
  }
}

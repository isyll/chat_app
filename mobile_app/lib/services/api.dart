import 'dart:convert';

import 'package:chat_app/config/constants.dart';
import 'package:chat_app/data/messages.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String cleanUrl = Constants.apiUrl.endsWith('/')
      ? Constants.apiUrl.substring(0, Constants.apiUrl.length - 1)
      : Constants.apiUrl;

  static Future<http.Response> getLatestMessages() async {
    await Future.delayed(
        const Duration(seconds: Constants.apiResponseDelay), () => null);
    final data = jsonEncode(MessagesData.latestMssages);
    return http.Response(data, 200);
  }
}

import 'package:http/http.dart' as http;

bool isHttpClientError(dynamic error) {
  return error is http.ClientException;
}

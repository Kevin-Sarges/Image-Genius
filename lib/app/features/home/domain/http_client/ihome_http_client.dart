import 'package:http/http.dart';

abstract interface class HomeHttpClientImpl {
  Future<Response> post(String url, Map<String, String>? headers, String? body);
}

import 'package:http/http.dart' as http;
import 'package:image_genius/app/features/home/domain/http_client/ihome_http_client.dart';

class HomeHttpClient implements HomeHttpClientImpl {
  final client = http.Client();

  @override
  Future<http.Response> post(
    String url,
    Map<String, String>? headers,
    String? body,
  ) async {
    final response = await client.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    return response;
  }
}

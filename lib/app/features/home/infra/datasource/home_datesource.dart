import 'dart:convert';
import 'dart:io';
import 'package:flutter_config/flutter_config.dart';
import 'package:image_genius/app/common/entity/entity_api.dart';
import 'package:image_genius/app/common/err/common_errors.dart';
import 'package:image_genius/app/common/model/model_api.dart';
import 'package:image_genius/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:image_genius/app/features/home/domain/http_client/ihome_http_client.dart';

class HomeDataSoucer implements HomeDataSourceImpl {
  final HomeHttpClientImpl homeHttpClient;

  HomeDataSoucer({required this.homeHttpClient});

  @override
  Future<List<EntityApi>> gerandoImagem(String prompt) async {
    try {
      String apiKey = FlutterConfig.get('API_KEY');
      const n = 5;
      const size = '256x256';

      final headers = {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      };
      final body = jsonEncode({
        'prompt': prompt,
        'n': n,
        'size': size,
      });

      final response = await homeHttpClient.post(
        FlutterConfig.get('API_URL'),
        headers,
        body,
      );

      if (response.statusCode == 200) {
        final List<ModelApi> list = [];

        final jsonData = jsonDecode(response.body);

        for (final item in jsonData['data']) {
          final ModelApi data = ModelApi.fromJson(item);
          list.add(data);
        }

        return list;
      } else {
        throw CommonDesconhecidoError(message: response.statusCode.toString());
      }
    } on HttpException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}

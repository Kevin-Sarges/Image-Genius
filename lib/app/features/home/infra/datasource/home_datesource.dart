import 'dart:convert';
import 'dart:io';
import 'package:image_genius/app/common/entity/entity_api.dart';
import 'package:image_genius/app/common/err/common_errors.dart';
import 'package:image_genius/app/common/model/model_api.dart';
import 'package:image_genius/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:image_genius/app/features/home/domain/http_client/ihome_http_client.dart';

const apiKey = String.fromEnvironment('DALLE_APIKEY');
const baseUrl = String.fromEnvironment('BASE_URL_API');

class HomeDataSoucer implements HomeDataSourceImpl {
  final HomeHttpClientImpl homeHttpClient;

  HomeDataSoucer({required this.homeHttpClient});

  @override
  Future<List<EntityApi>> gerandoImagem(String prompt) async {
    try {
      const n = 5;
      const size = '512x512';

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
        baseUrl,
        headers,
        body,
      );

      if (response.statusCode != 200) {
        throw CommonDesconhecidoError(
          message: 'Erro na Criação da imagem.\nTente novamente mais tarde',
        );
      } else {
        final List<ModelApi> list = [];

        final jsonData = jsonDecode(response.body);

        for (final item in jsonData['data']) {
          final ModelApi data = ModelApi.fromJson(item);
          list.add(data);
        }

        return list;
      }
    } on HttpException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}

import 'package:image_genius/app/common/entity/entity_api.dart';

class ModelApi extends EntityApi {
  ModelApi({required super.url});

  factory ModelApi.fromJson(Map<String, dynamic> json) {
    return ModelApi(url: json['url']);
  }

  static List<EntityApi> fronJsonList(List list) {
    return list.map((map) => ModelApi.fromJson(map)).toList();
  }
}

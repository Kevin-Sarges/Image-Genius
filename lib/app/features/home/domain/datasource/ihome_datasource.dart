import 'package:image_genius/app/common/entity/entity_api.dart';

abstract interface class HomeDataSourceImpl {
  Future<List<EntityApi>> gerandoImagem(String prompt);
}

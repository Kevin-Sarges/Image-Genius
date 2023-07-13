import 'package:dartz/dartz.dart';
import 'package:image_genius/app/common/entity/entity_api.dart';
import 'package:image_genius/app/common/err/failure.dart';

abstract interface class HomeRepositoryImpl {
  Future<Either<Failure, List<EntityApi>>> gerandoImagens(String prompt);
}

import 'package:dartz/dartz.dart';
import 'package:image_genius/app/common/entity/entity_api.dart';
import 'package:image_genius/app/common/err/failure.dart';
import 'package:image_genius/app/features/home/domain/repository/ihome_repository.dart';

class GerandoImageUseCase {
  final HomeRepositoryImpl repositoryImpl;

  GerandoImageUseCase({required this.repositoryImpl});
  Future<Either<Failure, List<EntityApi>>> call(String prompt) async {
    return await repositoryImpl.gerandoImagens(prompt);
  }
}

import 'package:dartz/dartz.dart';
import 'package:image_genius/app/common/entity/entity_api.dart';
import 'package:image_genius/app/common/err/failure.dart';
import 'package:image_genius/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:image_genius/app/features/home/domain/repository/ihome_repository.dart';

class HomeRepository implements HomeRepositoryImpl {
  final HomeDataSourceImpl dataSourceImpl;

  HomeRepository({required this.dataSourceImpl});

  @override
  Future<Either<Failure, List<EntityApi>>> gerandoImagens(String prompt) async {
    try {
      final result = await dataSourceImpl.gerandoImagem(prompt);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}

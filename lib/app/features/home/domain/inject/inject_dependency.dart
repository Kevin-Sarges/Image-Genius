import 'package:get_it/get_it.dart';
import 'package:image_genius/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:image_genius/app/features/home/domain/http_client/ihome_http_client.dart';
import 'package:image_genius/app/features/home/domain/repository/ihome_repository.dart';
import 'package:image_genius/app/features/home/domain/usecase/gerando_imagem.dart';
import 'package:image_genius/app/features/home/external/http_client/home_http_client.dart';
import 'package:image_genius/app/features/home/infra/datasource/home_datesource.dart';
import 'package:image_genius/app/features/home/infra/repository/home_repository.dart';
import 'package:image_genius/app/features/home/presenter/controller/home_cubit.dart';

class InjectDependency {
  static void init() {
    final getIt = GetIt.instance;

    getIt.registerFactory<HomeHttpClientImpl>(
      () => HomeHttpClient(),
    );

    getIt.registerFactory<HomeDataSourceImpl>(
      () => HomeDataSoucer(homeHttpClient: getIt()),
    );

    getIt.registerFactory<HomeRepositoryImpl>(
      () => HomeRepository(dataSourceImpl: getIt()),
    );

    getIt.registerFactory<GerandoImageUseCase>(
      () => GerandoImageUseCase(repositoryImpl: getIt()),
    );

    getIt.registerFactory<HomeCubit>(
      () => HomeCubit(gerandoImageUseCase: getIt()),
    );
  }
}

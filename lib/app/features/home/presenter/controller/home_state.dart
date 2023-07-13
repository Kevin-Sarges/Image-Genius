import 'package:image_genius/app/common/entity/entity_api.dart';
import 'package:image_genius/app/common/err/failure.dart';

sealed class HomeState {}

final class HomeInit extends HomeState {}

final class HomeCarregando extends HomeState {}

final class HomeSucesso extends HomeState {
  final List<EntityApi> list;

  HomeSucesso(this.list);
}

final class HomeErro extends HomeState {
  final Failure erro;

  HomeErro(this.erro);
}

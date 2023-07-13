import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_genius/app/features/home/domain/usecase/gerando_imagem.dart';
import 'package:image_genius/app/features/home/presenter/controller/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.gerandoImageUseCase}) : super(HomeInit());

  final GerandoImageUseCase gerandoImageUseCase;

  Future<void> gerandoImagem(String prompt) async {
    emit(HomeCarregando());

    final result = await gerandoImageUseCase(prompt);

    result.fold(
      (erro) => emit(HomeErro(erro)),
      (sucesso) => emit(HomeSucesso(sucesso)),
    );
  }
}

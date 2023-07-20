import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_genius/app/common/color/app_colors.dart';
import 'package:image_genius/app/features/home/presenter/controller/home_cubit.dart';
import 'package:image_genius/app/features/home/presenter/controller/home_state.dart';
import 'package:image_genius/app/features/home/presenter/widgets/button_widget.dart';
import 'package:image_genius/app/features/home/presenter/widgets/dicas_widget.dart';
import 'package:image_genius/app/features/home/presenter/widgets/initial_list_image_widget.dart';
import 'package:image_genius/app/features/home/presenter/widgets/input_widget.dart';
import 'package:image_genius/app/features/home/presenter/widgets/skeleton_loading_widget.dart';
import 'package:image_genius/app/features/image/image_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textControllerFiles = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _cubit = GetIt.I.get<HomeCubit>();

  final List<String> _listText = [
    'Nesta primeira versão do aplicativo, apenas são exibidas 5 imagens por vez, e o tamanho dessas imagens é de 512x512 pixels.',
    'Você pode fazer o download das imagens. Para isso, clique na imagem desejada e será redirecionado para uma nova tela. Nessa tela, você poderá atribuir um nome à imagem e, finalmente, baixá-la.',
    'Lembre-se de fornecer detalhes claros sobre como você deseja a imagem. Por exemplo: "Eu gostaria de um escudo para um time de futebol com as cores azul, preto e branco".',
  ];

  void _configurandoModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return DicasWidget(listText: _listText);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(9, 50, 9, 2),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: InputWidget(
                        textControllerFiles: _textControllerFiles,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ButtonWidget(
                    onTap: () {
                      setState(() {
                        _cubit.gerandoImagem(_textControllerFiles.text);
                        _textControllerFiles.text = '';
                        FocusScope.of(context).unfocus();
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 24),
              Divider(
                height: 2,
                color: AppColors.white,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  bloc: _cubit,
                  builder: (context, state) {
                    if (state is HomeCarregando) {
                      return const SkeletonLoading();
                    }

                    if (state is HomeErro) {
                      return Center(
                        child: Text(
                          state.erro.errorMessage,
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                      );
                    }

                    if (state is HomeSucesso) {
                      return GridView.builder(
                        itemCount: state.list.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ImageScreen(
                                    image: state.list[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 180,
                              height: 180,
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                image: DecorationImage(
                                  image: NetworkImage(state.list[index].url),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }

                    return const InitialListImageWidget();
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _configurandoModalBottomSheet(context);
        },
        child: const Icon(Icons.question_mark_outlined),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:image_genius/app/common/color/app_colors.dart';
import 'package:image_genius/app/common/entity/entity_api.dart';
import 'package:image_genius/app/features/image/widgets/messenger_snakbar.dart';
import 'package:image_genius/app/features/image/widgets/nome_imagem_widget.dart';
import 'package:image_genius/app/features/image/widgets/novo_nome_imagem_widget.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key, required this.image}) : super(key: key);

  final EntityApi image;

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  String _nomeImagem = 'Nome da Imagem';
  bool _clickUpdate = false;
  bool _carregando = false;

  final TextEditingController _textEditingController = TextEditingController();

  void _updateNomeLocal() {
    setState(() {
      _nomeImagem = _textEditingController.text;
      _clickUpdate = false;
    });
  }

  void _editNome() {
    setState(() {
      _clickUpdate = true;
      _nomeImagem = 'Nome da Imagem';
    });
  }

  void _saveNetworkImage() async {
    final imageUrl = widget.image.url;
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      final directory = (await getApplicationDocumentsDirectory()).path;
      final filePath = '$directory/$_nomeImagem.png';
      await File(filePath).writeAsBytes(bytes);

      GallerySaver.saveImage(filePath, albumName: 'Image Genius')
          .then((bool? success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.white,
            duration: const Duration(seconds: 2),
            content: const MessengerSnackBarWidget(
              messenger: 'Sua imagem foi salva com sucesso !!',
            ),
          ),
        );

        setState(() {
          _carregando = false;
        });
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.white,
          duration: const Duration(seconds: 2),
          content: const MessengerSnackBarWidget(
            messenger: 'Erro ao salvar imagem !!',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bluePrimary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Column(
                  children: [
                    Image.network(
                      widget.image.url,
                      width: width,
                    ),
                    const SizedBox(height: 20),
                    _clickUpdate
                        ? NovoNomeImagemWidget(
                            controller: _textEditingController,
                            onPressedClose: () {
                              setState(() {
                                _clickUpdate = false;
                                _nomeImagem = 'Nome da Imagem';
                              });
                            },
                            onPressedSend: () {
                              _updateNomeLocal();
                            },
                          )
                        : NomeImagemWidget(
                            nomeImagem: _nomeImagem,
                            icon: Icons.edit,
                            onPressed: () {
                              _editNome();
                            },
                          ),
                    const SizedBox(height: 60),
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      color: _carregando
                          ? AppColors.grey
                          : AppColors.blueSecondary,
                      child: InkWell(
                        onTap: _carregando
                            ? null
                            : () {
                                _saveNetworkImage();
                                setState(() {
                                  _carregando = true;
                                });
                              },
                        splashColor: AppColors.grey,
                        child: AnimatedContainer(
                          width: _carregando ? 100 : width * 0.5,
                          height: 50,
                          duration: const Duration(milliseconds: 600),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _carregando
                                ? [
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: AppColors.white,
                                      ),
                                    )
                                  ]
                                : [
                                    Text(
                                      'Baixar',
                                      style: TextStyle(color: AppColors.white),
                                    ),
                                    Icon(
                                      Icons.download,
                                      color: AppColors.white,
                                    ),
                                  ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

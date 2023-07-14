import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_genius/app/common/color/app_colors.dart';
import 'package:image_genius/app/common/entity/entity_api.dart';
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
    String path = widget.image.url;
    GallerySaver.saveImage(path, albumName: 'Média').then((bool? success) {
      setState(() {
        print('Image is saved......................');
      });
    });
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
                    const SizedBox(height: 80),
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
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _saveNetworkImage,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Baixar'),
                          Icon(
                            Icons.download,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
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

import 'package:flutter/material.dart';
import 'package:image_genius/app/common/color/app_colors.dart';

class InitialListImageWidget extends StatelessWidget {
  const InitialListImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/sem-imagens.png',
            width: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 24),
          Text(
            'Sem imagens no momento',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            'Se você deseja criar uma \nnova imagem, basta digitar no campo\n de entrada acima.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

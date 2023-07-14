import 'package:flutter/material.dart';
import 'package:image_genius/app/common/color/app_colors.dart';

class NomeImagemWidget extends StatelessWidget {
  const NomeImagemWidget({
    super.key,
    required this.nomeImagem,
    required this.icon,
    required this.onPressed,
  });

  final String nomeImagem;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          nomeImagem,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:image_genius/app/common/color/app_colors.dart';

class NovoNomeImagemWidget extends StatelessWidget {
  const NovoNomeImagemWidget({
    super.key,
    required this.controller,
    required this.onPressedClose,
    required this.onPressedSend,
  });

  final TextEditingController controller;
  final VoidCallback onPressedClose;
  final VoidCallback onPressedSend;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            style: TextStyle(color: AppColors.white),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: onPressedClose,
          icon: Icon(
            Icons.close,
            color: AppColors.red,
          ),
        ),
        IconButton(
          onPressed: onPressedSend,
          icon: Icon(
            Icons.send_rounded,
            color: AppColors.blueSecondary,
          ),
        ),
      ],
    );
  }
}

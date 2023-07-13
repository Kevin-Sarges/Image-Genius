import 'package:flutter/material.dart';
import 'package:image_genius/app/common/color/app_colors.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required TextEditingController textControllerFiles,
  }) : _textControllerFiles = textControllerFiles;

  final TextEditingController _textControllerFiles;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textControllerFiles,
      style: TextStyle(
        color: AppColors.white,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white,
          ),
        ),
        border: const OutlineInputBorder(),
        hintText: 'Crie uma logo azul....',
        hintStyle: TextStyle(
          color: AppColors.grey,
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'O campo esta vazio';
        }
        return null;
      },
    );
  }
}

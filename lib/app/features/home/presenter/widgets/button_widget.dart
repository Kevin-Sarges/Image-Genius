import 'package:flutter/material.dart';
import 'package:image_genius/app/common/color/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: AppColors.blueSecondary,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.white,
        child: SizedBox(
          width: 80,
          height: 60,
          child: Center(
            child: Icon(
              Icons.image_search_rounded,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}

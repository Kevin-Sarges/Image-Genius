import 'package:flutter/material.dart';
import 'package:image_genius/app/common/color/app_colors.dart';

class MessengerSnackBarWidget extends StatelessWidget {
  const MessengerSnackBarWidget({
    super.key,
    required this.messenger,
  });

  final String messenger;

  @override
  Widget build(BuildContext context) {
    return Text(
      messenger,
      style: TextStyle(
        color: AppColors.bluePrimary,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:image_genius/app/common/color/app_colors.dart';

class DicasWidget extends StatelessWidget {
  const DicasWidget({
    super.key,
    required List<String> listText,
  }) : _listText = listText;

  final List<String> _listText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.bluePrimary),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Observações e Dicas',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            height: 2,
            color: AppColors.white,
          ),
          Expanded(
            child: ListView(
              children: _listText
                  .map(
                    (text) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

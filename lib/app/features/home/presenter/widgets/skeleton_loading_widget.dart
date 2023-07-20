import 'package:flutter/material.dart';
import 'package:image_genius/app/common/color/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoading extends StatelessWidget {
  const SkeletonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: [
        Shimmer.fromColors(
          baseColor: AppColors.grey,
          highlightColor: AppColors.white,
          child: Container(
            width: 180,
            height: 180,
            color: Colors.grey,
          ),
        ),
        Shimmer.fromColors(
          baseColor: AppColors.grey,
          highlightColor: AppColors.white,
          child: Container(
            width: 180,
            height: 180,
            color: Colors.grey,
          ),
        ),
        Shimmer.fromColors(
          baseColor: AppColors.grey,
          highlightColor: AppColors.white,
          child: Container(
            width: 180,
            height: 180,
            color: Colors.grey,
          ),
        ),
        Shimmer.fromColors(
          baseColor: AppColors.grey,
          highlightColor: AppColors.white,
          child: Container(
            width: 180,
            height: 180,
            color: Colors.grey,
          ),
        ),
        Shimmer.fromColors(
          baseColor: AppColors.grey,
          highlightColor: AppColors.white,
          child: Container(
            width: 180,
            height: 180,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

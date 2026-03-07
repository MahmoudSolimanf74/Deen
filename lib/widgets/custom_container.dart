import 'package:eslamicapp/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  const CustomContainer({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.green,
      ),
      height:height ?? 450,
    );
  }
}

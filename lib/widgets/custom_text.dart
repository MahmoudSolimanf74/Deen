import 'package:eslamicapp/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;

  const CustomText({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColors.white,
        fontWeight: fontWeight ?? .bold,
        fontSize: size ?? 30,
      ),
    );
  }
}

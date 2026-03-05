import 'package:eslamicapp/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final Color color;
  final IconData icon;
  const CustomIcon({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: .circle, color: color),
      width: 48,
      height: 48,
      child: Icon(icon, color: AppColors.white, size: 28),
    );
  }
}

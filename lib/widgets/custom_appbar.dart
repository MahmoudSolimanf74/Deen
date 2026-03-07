import 'package:eslamicapp/theme/app_colors.dart';
import 'package:eslamicapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomAppbar extends StatelessWidget {
  final String tilte;
  final String subtilte;
  final IconData? icon1;
  final IconData? icon2;

  const CustomAppbar({
    super.key,
    required this.tilte,
    required this.subtilte,
    this.icon1,
    this.icon2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .center,
      children: [
        Icon(icon1, color: AppColors.white),
        Gap(8),
        Icon(icon2, color: AppColors.white),
        Spacer(),
        Column(
          crossAxisAlignment: .end,
          children: [
            CustomText(text: tilte, size: 30),
            CustomText(text: subtilte, size: 14),
          ],
        ),
      ],
    );
  }
}

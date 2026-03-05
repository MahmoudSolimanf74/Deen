import 'package:eslamicapp/theme/app_colors.dart';
import 'package:eslamicapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColors.green,
            ),
            height: 450,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Gap(45),
                Row(
                  crossAxisAlignment: .center,
                  children: [
                    Icon(Icons.settings, color: AppColors.white),
                    Gap(8),
                    Icon(Icons.dark_mode_outlined, color: AppColors.white),
                    Spacer(),
                    Column(
                      crossAxisAlignment: .end,
                      children: [
                        CustomText(text: "المصحف الشريف"),
                        CustomText(text: "السلام عليكم ورحمة الله", size: 14),
                      ],
                    ),
                  ],
                ),
                Gap(24),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: .circular(25),
                    color: AppColors.white,
                  ),
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        //row1
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: .start,
                              children: [
                                CustomText(
                                  text: "12:30",
                                  color: AppColors.green,
                                  size: 20,
                                ),
                                CustomText(
                                  text: "بعد ساعه و 15 دقيقه ",
                                  color: AppColors.grey,
                                  size: 14,
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: .end,
                              children: [
                                CustomText(
                                  text: "الصلاة القادمة",
                                  color: AppColors.grey,
                                  size: 12,
                                ),
                                CustomText(
                                  text: "صلاة الظهر",
                                  color: AppColors.black,
                                  size: 24,
                                ),
                              ],
                            ),
                            Gap(12),
                            Container(
                              decoration: BoxDecoration(
                                shape: .circle,
                                color: AppColors.green,
                              ),
                              width: 48,
                              height: 48,
                              child: Icon(
                                Icons.access_time_rounded,
                                color: AppColors.white,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                        //row2
                        Gap(40),
                        LinearProgressIndicator(value: .5),
                        //row3
                        Gap(40),
                        Divider(color: AppColors.green),
                        Row(
                          mainAxisAlignment: .spaceAround,
                          children: [
                            ...List.generate(
                              5,
                              (index) => Container(
                                color: AppColors.gold,
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: .circular(25),
                    color: const Color.fromARGB(255, 240, 213, 126),
                    border: Border.all(color: AppColors.gold, width: 3),
                  ),
                  width: 390,
                  height: 250,
                ),

                
              ],
            ),
          ),
        ],
      ),
    );
  }
}

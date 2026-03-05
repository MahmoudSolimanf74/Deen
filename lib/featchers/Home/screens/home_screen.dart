import 'package:eslamicapp/featchers/Home/viewmodel/home_viewmodel.dart';
import 'package:eslamicapp/theme/app_colors.dart';
import 'package:eslamicapp/widgets/custom_icon.dart';
import 'package:eslamicapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewmodel viewmodel = HomeViewmodel();
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
            child: SingleChildScrollView(
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
                          CustomText(text: "المصحف الشريف", size: 30),
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
                              CustomIcon(
                                color: AppColors.green,
                                icon: Icons.access_time_rounded,
                              ),
                            ],
                          ),
                          //row2
                          Gap(40),
                          Directionality(
                            textDirection: .rtl,
                            child: LinearProgressIndicator(
                              value: .5,
                              color: AppColors.green,
                              backgroundColor: const Color.fromARGB(
                                255,
                                226,
                                226,
                                226,
                              ),
                              borderRadius: .circular(15),
                            ),
                          ),
                          //row3
                          Gap(40),
                          Divider(color: AppColors.green),
                          Row(
                            mainAxisAlignment: .spaceAround,
                            children: [
                              ...List.generate(
                                5,
                                (index) => Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: .circle,
                                        color: index % 2 == 0
                                            ? AppColors.gold
                                            : AppColors.green,
                                      ),
                                      width: 25,
                                      height: 25,
                                      child: Icon(
                                        viewmodel.prayers[index].icon,
                                        color: AppColors.white,
                                        size: 18,
                                      ),
                                    ),
                                    CustomText(
                                      text: viewmodel.prayers[index].prayname,
                                      size: 12,
                                      color: AppColors.grey,
                                    ),
                                    CustomText(
                                      text: viewmodel.prayers[index].praytime,
                                      size: 12,
                                      color: AppColors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  //golden cont
                  Gap(20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: .circular(25),
                      color: const Color.fromARGB(255, 240, 213, 126),
                      border: Border.all(color: AppColors.gold, width: 3),
                    ),
                    width: 390,
                    height: 250,
                    child: Column(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        CustomIcon(color: AppColors.gold, icon: Icons.star),
                        CustomText(
                          text: "آية اليوم",
                          size: 12,
                          color: AppColors.black,
                        ),
                        SizedBox(
                          width: 60,
                          child: Divider(color: AppColors.gold),
                        ),
                        CustomText(
                          text: "﴾ وَقُل رَّبِّ زِدۡنِی عِلۡمࣰا ﴿",
                          size: 24,
                          color: AppColors.black,
                        ),
                        SizedBox(
                          width: 60,
                          child: Divider(color: AppColors.gold),
                        ),
                        CustomText(
                          text: "سورة طه - آية 114",
                          size: 14,
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                  ),

                  //grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => viewmodel.cards[index].page!,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 15,
                              spreadRadius: 1,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomIcon(
                                color: index % 2 == 0
                                    ? AppColors.gold
                                    : AppColors.green,
                                icon: viewmodel.cards[index].icon,
                              ),
                              Gap(15),
                              CustomText(
                                text: viewmodel.cards[index].title,
                                size: 18,
                                color: AppColors.black,
                              ),
                              CustomText(
                                text: viewmodel.cards[index].subtite,
                                size: 12,
                                fontWeight: FontWeight.normal,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

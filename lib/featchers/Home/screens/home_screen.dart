import 'package:eslamicapp/core/prayer_times/bloc/prayer_times_cubit.dart';
import 'package:eslamicapp/core/prayer_times/models/pray_time_model.dart';
import 'package:eslamicapp/featchers/Home/viewmodel/home_viewmodel.dart';
import 'package:eslamicapp/theme/app_colors.dart';
import 'package:eslamicapp/widgets/custom_appbar.dart';
import 'package:eslamicapp/widgets/custom_container.dart';
import 'package:eslamicapp/widgets/custom_icon.dart';
import 'package:eslamicapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quran_library/quran_library.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewmodel viewmodel = HomeViewmodel();

    return BlocProvider(
      create: (_) => PrayerTimesCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            CustomContainer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(45),
                    CustomAppbar(
                      tilte: "المصحف الشريف",
                      subtilte: "السلام عليكم ورحمة الله",
                      icon1: Icons.settings,
                      icon2: Icons.dark_mode_outlined,
                    ),
                    Gap(24),

                    // Prayer Times Container
                    BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
                      builder: (context, state) {
                        if (state.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        DateTime now = DateTime.now();
                        PrayTimeModel nextPrayer;

                        // نبحث عن أول صلاة بعد الوقت الحالي
                        try {
                          nextPrayer = state.prayers.firstWhere(
                            (p) => p.praytimeDateTime.isAfter(now),
                          );
                        } catch (_) {
                          final tomorrowFajr = state
                              .prayers
                              .first
                              .praytimeDateTime
                              .add(const Duration(days: 1));
                          nextPrayer = PrayTimeModel(
                            icon: state.prayers.first.icon,
                            prayname: state.prayers.first.prayname,
                            praytime: state.prayers.first.praytime,
                            praytimeDateTime: tomorrowFajr,
                            notificationEnabled:
                                state.prayers.first.notificationEnabled,
                          );
                        }

                        // نحسب الوقت المتبقي
                        final difference = nextPrayer.praytimeDateTime
                            .difference(now);
                        final hoursLeft = difference.inHours;
                        final minutesLeft = difference.inMinutes % 60;

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.white,
                          ),
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                // Row 1: Next Prayer
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text:
                                              "${nextPrayer.praytimeDateTime.hour.toString().padLeft(2, '0')}:${nextPrayer.praytimeDateTime.minute.toString().padLeft(2, '0')}",
                                          color: AppColors.green,
                                          size: 20,
                                        ),
                                        Directionality(
                                          textDirection: .rtl,
                                          child: CustomText(
                                            text:
                                                "$hoursLeft ساعة و $minutesLeft دقيقة للـ ${nextPrayer.prayname}",
                                            color: AppColors.grey,
                                            size: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const CustomText(
                                          text: "الصلاة القادمة",
                                          color: AppColors.grey,
                                          size: 12,
                                        ),
                                        CustomText(
                                          text: nextPrayer.prayname,
                                          color: AppColors.black,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                    const Gap(12),
                                    const CustomIcon(
                                      color: AppColors.green,
                                      icon: Icons.access_time_rounded,
                                    ),
                                  ],
                                ),

                                const Gap(40),
                                const Divider(color: AppColors.green),

                                // Row 2: Prayer Times Icons
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ...List.generate(
                                      state.prayers.length,
                                      (index) => Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: index % 2 == 0
                                                  ? AppColors.gold
                                                  : AppColors.green,
                                            ),
                                            width: 25,
                                            height: 25,
                                            child: Icon(
                                              state.prayers[index].icon,
                                              color: AppColors.white,
                                              size: 18,
                                            ),
                                          ),
                                          CustomText(
                                            text: state.prayers[index].prayname,
                                            size: 12,
                                            color: AppColors.grey,
                                          ),
                                          CustomText(
                                            text: state.prayers[index].praytime,
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
                        );
                      },
                    ),

                    // Golden Container: Ayah of the Day
                    const Gap(20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 240, 213, 126),
                        border: Border.all(color: AppColors.gold, width: 3),
                      ),
                      width: 390,
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CustomIcon(
                            color: AppColors.gold,
                            icon: Icons.star,
                          ),
                          const CustomText(
                            text: "آية اليوم",
                            size: 12,
                            color: AppColors.black,
                          ),
                          const SizedBox(
                            width: 60,
                            child: Divider(color: AppColors.gold),
                          ),
                          const CustomText(
                            text: "﴾ وَقُل رَّبِّ زِدۡنِی عِلۡمࣰا ﴿",
                            size: 24,
                            color: AppColors.black,
                          ),
                          const SizedBox(
                            width: 60,
                            child: Divider(color: AppColors.gold),
                          ),
                          const CustomText(
                            text: "سورة طه - آية 114",
                            size: 14,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                    ),

                    // Grid Cards
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
                                color: Colors.black.withOpacity(0.08),
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
                                const Gap(15),
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
      ),
    );
  }
}

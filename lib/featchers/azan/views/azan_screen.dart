import 'package:eslamicapp/core/prayer_times/bloc/prayer_times_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:eslamicapp/theme/app_colors.dart';
import 'package:eslamicapp/widgets/custom_container.dart';
import 'package:eslamicapp/widgets/custom_appbar.dart';
import 'package:eslamicapp/widgets/custom_text.dart';

class AzanScreen extends StatefulWidget {
  const AzanScreen({super.key});

  @override
  State<AzanScreen> createState() => _AzanScreenState();
}

class _AzanScreenState extends State<AzanScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PrayerTimesCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            CustomContainer(height: .infinity),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Gap(45),
                  CustomAppbar(
                    tilte: "مواقيت الصلاة",
                    subtilte: "أوقات دقيقة حسب موقعك",
                    icon1: Icons.settings,
                  ),
                  Expanded(
                    child: BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
                      builder: (context, state) {
                        if (state.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ListView.separated(
                          itemCount: state.prayers.length,
                          separatorBuilder: (_, __) => const Gap(15),
                          itemBuilder: (context, index) {
                            final prayer = state.prayers[index];
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white24,
                              ),
                              height: 100,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: prayer.praytime,
                                        size: 24,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.notifications,
                                            color: AppColors.black,
                                          ),
                                          Switch(
                                            activeThumbColor: AppColors.white,
                                            inactiveThumbColor: Colors.red,
                                            value: prayer.notificationEnabled,
                                            onChanged: (_) => context
                                                .read<PrayerTimesCubit>()
                                                .toggleNotification(index),
                                          ),
                                          Text(
                                            prayer.notificationEnabled
                                                ? "مفعل"
                                                : "مغلق",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  CustomText(
                                    text: prayer.prayname,
                                    size: 24,
                                    color: AppColors.black,
                                  ),
                                  const Gap(16),
                                  Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    width: 55,
                                    height: 55,
                                    child: Icon(
                                      prayer.icon,
                                      color: AppColors.black,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

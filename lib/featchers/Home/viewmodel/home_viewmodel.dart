import 'package:eslamicapp/featchers/Home/model/home_card_model.dart';
import 'package:eslamicapp/featchers/Home/model/pray_time_model.dart';
import 'package:eslamicapp/featchers/moshaf/quran.dart';
import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier {
  List<HomeCardModel> cards = [
    HomeCardModel(
      icon: Icons.book,
      title: "المصحف",
      subtite: "قراءة القرآن الكريم",
      page: Quran(),
    ),
    HomeCardModel(
      icon: Icons.access_time,
      title: "الأذان",
      subtite: "مواقيت الصلاة",
    ),
    HomeCardModel(
      icon: Icons.back_hand_outlined,
      title: "الأدعية والأذكار",
      subtite: "حصن المسلم",
    ),
    HomeCardModel(
      icon: Icons.circle_outlined,
      title: "المسبحة",
      subtite: "عداد التسبيح",
    ),
  ];

  List<PrayTimeModel> prayers = [
    PrayTimeModel(
      icon: Icons.wb_twighlight,
      prayname: "الفجر",
      praytime: "5:15",
    ),
    PrayTimeModel(icon: Icons.wb_sunny, prayname: "الظهر", praytime: "5:15"),
    PrayTimeModel(icon: Icons.wb_cloudy, prayname: "العصر", praytime: "5:15"),
    PrayTimeModel(
      icon: Icons.nights_stay,
      prayname: "المغرب",
      praytime: "5:15",
    ),
    PrayTimeModel(icon: Icons.dark_mode, prayname: "العشاء", praytime: "5:15"),
  ];
}

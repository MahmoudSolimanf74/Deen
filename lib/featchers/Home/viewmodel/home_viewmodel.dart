import 'package:eslamicapp/featchers/Home/model/home_card_model.dart';
import 'package:eslamicapp/featchers/azan/views/azan_screen.dart';
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
      page: AzanScreen(),
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

  
}

import 'package:flutter/material.dart';

class PrayTimeModel {
  final IconData icon;
  final String prayname;
  final String praytime;
  final DateTime praytimeDateTime; // جديد
  bool notificationEnabled;

  PrayTimeModel({
    required this.icon,
    required this.prayname,
    required this.praytime,
    required this.praytimeDateTime,
    this.notificationEnabled = true,
  });
}

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/pray_time_model.dart';

class PrayerTimesRepository {
  Future<List<PrayTimeModel>> fetchPrayerTimes() async {
    Position position = await Geolocator.getCurrentPosition();
    final coordinates = Coordinates(position.latitude, position.longitude);
    final params = CalculationMethod.egyptian.getParameters();
    final prayerTimes = PrayerTimes.today(coordinates, params);

    return [
      PrayTimeModel(
        icon: Icons.wb_twighlight,
        prayname: "الفجر",
        praytime: prayerTimes.fajr.toLocal().toString().substring(11, 16),
        praytimeDateTime: prayerTimes.fajr.toLocal(),
      ),
      PrayTimeModel(
        icon: Icons.wb_sunny,
        prayname: "الظهر",
        praytime: prayerTimes.dhuhr.toLocal().toString().substring(11, 16),
        praytimeDateTime: prayerTimes.dhuhr.toLocal(),
      ),
      PrayTimeModel(
        icon: Icons.wb_cloudy,
        prayname: "العصر",
        praytime: prayerTimes.asr.toLocal().toString().substring(11, 16),
        praytimeDateTime: prayerTimes.asr.toLocal(),
      ),
      PrayTimeModel(
        icon: Icons.nights_stay,
        prayname: "المغرب",
        praytime: prayerTimes.maghrib.toLocal().toString().substring(11, 16),
        praytimeDateTime: prayerTimes.maghrib.toLocal(),
      ),
      PrayTimeModel(
        icon: Icons.dark_mode,
        prayname: "العشاء",
        praytime: prayerTimes.isha.toLocal().toString().substring(11, 16),
        praytimeDateTime: prayerTimes.isha.toLocal(),
      ),
    ];
  }
}

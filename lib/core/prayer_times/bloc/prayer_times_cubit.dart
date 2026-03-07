import 'package:adhan/adhan.dart';
import 'package:eslamicapp/core/prayer_times/models/pray_time_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class PrayerTimesState {
  final List<PrayTimeModel> prayers;
  final bool loading;
  PrayerTimesState({required this.prayers, this.loading = false});
}

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit() : super(PrayerTimesState(prayers: [])) {
    getPrayerTimes();
  }

  Future<void> getPrayerTimes() async {
    emit(PrayerTimesState(prayers: state.prayers, loading: true));

    Position position = await Geolocator.getCurrentPosition();

    final coordinates = Coordinates(position.latitude, position.longitude);
    final params = CalculationMethod.egyptian.getParameters();
    final prayerTimes = PrayerTimes.today(coordinates, params);

    final prayers = [
      PrayTimeModel(
        icon: Icons.wb_twighlight,
        prayname: "الفجر",
        praytime: formatTime(prayerTimes.fajr),
        praytimeDateTime: prayerTimes.fajr,
      ),
      PrayTimeModel(
        icon: Icons.wb_sunny,
        prayname: "الظهر",
        praytime: formatTime(prayerTimes.dhuhr),
        praytimeDateTime: prayerTimes.dhuhr,
      ),
      PrayTimeModel(
        icon: Icons.wb_cloudy,
        prayname: "العصر",
        praytime: formatTime(prayerTimes.asr),
        praytimeDateTime: prayerTimes.asr,
      ),
      PrayTimeModel(
        icon: Icons.nights_stay,
        prayname: "المغرب",
        praytime: formatTime(prayerTimes.maghrib),
        praytimeDateTime: prayerTimes.maghrib,
      ),
      PrayTimeModel(
        icon: Icons.dark_mode,
        prayname: "العشاء",
        praytime: formatTime(prayerTimes.isha),
        praytimeDateTime: prayerTimes.isha,
      ),
    ];

    emit(PrayerTimesState(prayers: prayers, loading: false));
  }

  void toggleNotification(int index) {
    // ننسخ اللسته الحالية
    final updated = List<PrayTimeModel>.from(state.prayers);

    // نعكس حالة الإشعار
    updated[index].notificationEnabled = !updated[index].notificationEnabled;

    // نرسل الحالة الجديدة
    emit(PrayerTimesState(prayers: updated, loading: false));
  }

  String formatTime(DateTime dt) {
    return DateFormat.jm().format(dt); // مثال: 5:15 PM
  }
}

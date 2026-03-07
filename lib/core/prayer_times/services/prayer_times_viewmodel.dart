import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PrayerTimesViewmodel extends ChangeNotifier {
  PrayerTimes? prayerTimes;
  Future<Position> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getPrayerTimes() async {
    Position position = await getLocation();

    final coordinates = Coordinates(position.latitude, position.longitude);

    final params = CalculationMethod.egyptian.getParameters();

    prayerTimes = PrayerTimes.today(coordinates, params);
    notifyListeners();
  }
}

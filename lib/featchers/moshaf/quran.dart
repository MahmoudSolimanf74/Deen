import 'package:flutter/material.dart';
import 'package:quran_library/quran.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return QuranLibraryScreen(parentContext: context);
  }
}

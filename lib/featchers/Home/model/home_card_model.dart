import 'package:flutter/material.dart';

class HomeCardModel {
  final IconData icon;
  final String title;
  final String subtite;
  final Widget? page;

  HomeCardModel({
    required this.icon,
    required this.title,
    required this.subtite,
    this.page,
  });
}

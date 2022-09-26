import 'package:flutter/material.dart';

class NavigationService {
  static final navigationKey = GlobalKey<NavigatorState>();

  BuildContext? get context => navigationKey.currentContext!;

  void openDashboard() {
    Navigator.pushNamed(context!, '/dashboard');
  }
}
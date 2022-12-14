import 'package:flutter/material.dart';

class NavigationService {
  static final navigationKey = GlobalKey<NavigatorState>();

  BuildContext? get context => navigationKey.currentContext!;

  void openDashboard() {
    Navigator.pushReplacementNamed(context!, '/dashboard');
  }

  void openCreateChat() {
    Navigator.pushNamed(context!, '/create-chat');
  }
}

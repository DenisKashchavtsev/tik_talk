import 'package:flutter/material.dart';

class Styles {
  static const mainColor = Color(0xffe3864c);
  static const bodyColor = Color(0xFFEEECEC);
  static ButtonStyle buttonFilledStyles = ElevatedButton.styleFrom(
      primary: Styles.mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      textStyle: const TextStyle(
        fontSize: 20,
      ));
  static ButtonStyle buttonStyles = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      primary: Colors.white,
      side: const BorderSide(
        width: 2,
        color: Styles.mainColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      textStyle: const TextStyle(
        fontSize: 20,
      ));
}

import 'package:flutter/material.dart';

class ColorsApp {
  static Color mainClr = colorFromHex('#32357A');
  static Color primaryClr = colorFromHex('#32357A').withOpacity(0.17);
  static Color secondClr = colorFromHex('#32357A').withOpacity(0.90);
  static Color threedClr = colorFromHex('#005caa').withOpacity(0.90);
  static Color accentClr = colorFromHex('#FFA200');
  static Color greenClr = colorFromHex('#377B39');
  static Color whiteClr = Colors.white;
  static Color blackClr = Colors.black;
  static Color greyClr = Colors.grey;
  static Color topClr = colorFromHex('#32357A').withOpacity(0.90);
  static Color bottomClr = colorFromHex('#32357A').withOpacity(0.97);
  static Color mClr = Colors.blue.shade900;
  static Color blueClr = Colors.blue.shade300;
}

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

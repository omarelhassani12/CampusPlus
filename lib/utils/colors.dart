import 'package:flutter/material.dart';

class ColorsApp {
  static Color mainClr = colorFromHex('#32357A');
  static Color primaryClr = colorFromHex('#32357A').withOpacity(0.17);
  static Color secondClr = colorFromHex('#32357A').withOpacity(0.90);
  static Color accentClr = colorFromHex('#FFA200');
  static Color whiteClr = colorFromHex('#FFFF');
  static Color blackClr = colorFromHex('#000');
  static Color topClr = Colors.blue.shade900;
  static Color bottomClr = Colors.blue.shade300;
}

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

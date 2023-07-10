import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({this.size = 100});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/CampusPlus1.png',
      width: size,
      height: size,
    );
  }
}

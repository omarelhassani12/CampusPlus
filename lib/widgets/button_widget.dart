import 'package:flutter/material.dart';
import 'package:school_app/utils/colors.dart';

class WhiteButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const WhiteButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: ColorsApp.mainClr,
          backgroundColor: ColorsApp.whiteClr,
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
class MainButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const MainButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: ColorsApp.whiteClr,
          backgroundColor: ColorsApp.mainClr,
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../utils/colors.dart';

class LinkButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isSelected;

  const LinkButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  LinkButtonState createState() => LinkButtonState();
}

class LinkButtonState extends State<LinkButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: widget.isSelected
            ? ColorsApp.mainClr
            : ColorsApp.mainClr.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      ),
      child: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

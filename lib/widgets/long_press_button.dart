import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LongPressButton extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final String buttonText;
  final Color buttonTextColor;
  final Color toastBackgroundColor;
  final Color toastTextColor;
  final String toastMessage;

  const LongPressButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.buttonText,
    required this.buttonTextColor,
    required this.toastBackgroundColor,
    required this.toastTextColor,
    required this.toastMessage,
  }) : super(key: key);

  @override
  _LongPressButtonState createState() => _LongPressButtonState();
}

class _LongPressButtonState extends State<LongPressButton> {
  bool isLongPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          isLongPressed = true;
        });
      },
      onLongPressUp: () {
        setState(() {
          isLongPressed = false;
        });
      },
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: widget.iconColor,
            ),
            const SizedBox(height: 8),
            Text(
              widget.buttonText,
              style: TextStyle(
                color: widget.buttonTextColor,
              ),
            ),
            if (isLongPressed)
              Builder(
                builder: (context) {
                  Fluttertoast.showToast(
                    msg: widget.toastMessage,
                    backgroundColor: widget.toastBackgroundColor,
                    textColor: widget.toastTextColor,
                    gravity: ToastGravity.CENTER,
                  );
                  return const SizedBox.shrink();
                },
              ),
          ],
        ),
      ),
    );
  }
}

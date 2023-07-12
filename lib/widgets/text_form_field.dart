import 'package:flutter/material.dart';
import 'package:school_app/utils/colors.dart';

class MainTextFormField extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final bool enabled;
  final FormFieldValidator<String>? validator;

  const MainTextFormField({
    Key? key,
    required this.labelText,
    this.initialValue = '',
    this.enabled = true,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: ColorsApp.mainClr,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.mainClr,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.mainClr,
            width: 2.0,
          ),
        ),
      ),
      enabled: enabled,
    );
  }
}

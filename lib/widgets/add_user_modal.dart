import 'dart:math';
import 'package:flutter/material.dart';
import 'package:school_app/widgets/button_widget.dart';
import 'package:school_app/widgets/text_form_field.dart';

class AddUserModal extends StatelessWidget {
  const AddUserModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String generatePassword() {
      String letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
      Random random = Random();
      String password = 'CampusPlus';
      for (int i = 0; i < 6; i++) {
        password += letters[random.nextInt(letters.length)];
      }
      return password;
    }

    String generatedPassword = generatePassword();

    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('New User'),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      content: SizedBox(
        height: 250,
        child: Column(
          children: [
            const MainTextFormField(
              labelText: 'First Name',
            ),
            const MainTextFormField(
              labelText: 'Last Name',
            ),
            const MainTextFormField(
              labelText: 'Email',
            ),
            MainTextFormField(
              labelText: 'Generated Password',
              initialValue: generatedPassword,
              enabled: false,
            ),
          ],
        ),
      ),
      actions: [
        MainButton(
          buttonText: "Save",
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

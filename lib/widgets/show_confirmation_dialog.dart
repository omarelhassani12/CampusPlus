import 'package:flutter/material.dart';
import 'package:school_app/utils/colors.dart';

void showConfirmationDialog(BuildContext context, userName) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirmation"),
        content: Text("Are you sure you want to delete this $userName?"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Cancel",
              style: TextStyle(color: ColorsApp.mainClr),
            ),
          ),
          TextButton(
            onPressed: () {
              // Perform the delete operation
              // Add your delete logic here
              Navigator.of(context).pop();
            },
            child: Text(
              "Delete",
              style: TextStyle(color: ColorsApp.mainClr),
            ),
          ),
        ],
      );
    },
  );
}

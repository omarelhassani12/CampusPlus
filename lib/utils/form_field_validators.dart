import 'package:flutter/material.dart';

class FormFieldValidators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.endsWith('@gmail.com')) {
      return 'Please enter a valid Gmail address';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    if (!digitsOnly.startsWith('212') || digitsOnly.length != 12) {
      return 'Please enter a valid Moroccan phone number';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? validateFormFieldWithKeyboard(
      String? value, TextInputType keyboardType) {
    switch (keyboardType) {
      case TextInputType.emailAddress:
        return validateEmail(value);
      case TextInputType.phone:
        return validatePhoneNumber(value);
      case TextInputType.text:
        return validateName(value);
      case TextInputType.visiblePassword:
        return validatePassword(value);
      default:
        return null;
    }
  }
}



// class FormFieldValidators {
//   static String? validateName(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your name';
//     }
//     return null;
//   }

//   static String? validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your email';
//     }
//     if (!value.endsWith('@gmail.com')) {
//       return 'Please enter a valid Gmail address';
//     }
//     return null;
//   }

//   static String? validatePhoneNumber(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your phone number';
//     }
//     final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
//     if (!digitsOnly.startsWith('212') || digitsOnly.length != 12) {
//       return 'Please enter a valid Moroccan phone number';
//     }
//     return null;
//   }

//   static String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your password';
//     }
//     if (value.length < 8) {
//       return 'Password must be at least 8 characters';
//     }
//     return null;
//   }
// }

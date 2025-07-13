import 'package:flutter/material.dart';

import '../helpers/custom_toast.dart';

class CValidator {
  /// Validates email format
  bool validateEmail(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      CustomToast.show(
        context,
        message: 'Email is required',
        type: ToastType.error,
      );
      return false;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      CustomToast.show(
        context,
        message: 'Enter a valid email address',
        type: ToastType.error,
      );
      return false;
    }
    return true;
  }

  /// Validates phone number (10-15 digits, allows country code)
  bool validatePhone(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
       CustomToast.show(
        context,
        message: 'Phone number is required',
        type: ToastType.error,
      );
      return false;
    }

    final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    if (!phoneRegex.hasMatch(value.trim())) {
       CustomToast.show(
        context,
        message: 'Enter a valid phone number',
        type: ToastType.error,
      );
      return false;
    }

    return true;
  }

  /// Validates password (minimum 8 characters with letters & numbers)
bool validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      CustomToast.show(
        context,
        message: 'Password is required',
        type: ToastType.error,
      );
      return false;
    }

    if (value.length < 8) {
      CustomToast.show(
        context,
        message: 'Password must be at least 8 characters',
        type: ToastType.error,
      );
      return false;
    }

    final hasUppercase = RegExp(r'[A-Z]').hasMatch(value);
    final hasLowercase = RegExp(r'[a-z]').hasMatch(value);
    final hasDigit = RegExp(r'\d').hasMatch(value);
    final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);

    if (!hasUppercase || !hasLowercase || !hasDigit || !hasSpecialChar) {
      CustomToast.show(
        context,
        message:
            'Password must include uppercase, lowercase, number, and special character.',
        type: ToastType.error,
      );
      return false;
    }

    return true;
  }

}

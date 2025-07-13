// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CColors {
  CColors._();

  // App basic colors
  static const Color primary = Color(0xFF010D16);
  static const Color darkPrimary = Color(0xFF084B4C);
  static const Color secondary = Color(0xFFFFB74B);
  static const Color accent = Color(0xFFb0c7ff);

  //Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6c757d);
  static const Color onPrimaryColor = Colors.white;

  //formf field color
  static const Color inputBackground = Color(0xffE4EAEC);

  //background colors
  static const Color light = Color(0xfff6f6f6);
  static const Color dark = Color(0xff272727);
  static const Color primaryBackground = Color(0xfff3f5ff);
  static const Color profileBackground = Color(0xffF0F4F4);
  static const Color profiledivider = Color(0xffD4DFE1);

  //background container colors
  static const screenBackground = Color(0xffEDF6F5);
  static const bottomSheetBackground = Color(0xffEDEDED);
  static const Color lightContainer = Color(0xfff6f6f6);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  //button colors
  static const Color locEditButton = Color(0xFFE1E9EA);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFc4c4c4);

  //border colors
  static const Color borderPrimary = Color(0xFFE2E4E9);
  static const Color borderSecondary = Color(0xFFe6e6e6);

  // error and validation colors
  static const Color error = Color(0xFFB3261E);
  static const Color warning = Color(0xFFf57c00);
  static const Color success = Color(0xFF4caf50);
  static const Color indicator = Color(0xFF19AA4B);
  static const Color info = Color(0xFF1976d2);

  //neutral colors and shades
  static const Color black = Color(0xff010D16);
  static const Color darkerGray = Color(0xff4f4f4f);
  static const Color darkGray = Color(0xff939393);
  static const Color gray = Color(0xffe0e0e0);
  static const Color lightGray = Color(0xfff9f9f9);
  static const Color softGray = Color(0xfff4f4f4);
  static const Color white = Color(0xffffffff);

  // gradient color
  static const Gradient linearGradient = LinearGradient(
    colors: [
      Color(0xFF4b68ff),
      Color(0xFFFFe24b),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

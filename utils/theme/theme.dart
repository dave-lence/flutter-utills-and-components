
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottomsheet_theme.dart';
import 'custom_themes/button_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/outlinedbutton_theme.dart' show COutlinedButtonTheme;
import 'custom_themes/text_theme.dart';
import 'custom_themes/textfield_theme.dart';

class CAppTheme {
  CAppTheme._();

  static ThemeData lightThem = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CTextTheme.lightTextTheme,
    elevatedButtonTheme: CElevatedButton.lightElevatedButtonTheme,
    appBarTheme: CAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: CBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: CCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: CChipTheme.lightChipTheme,
    outlinedButtonTheme: COutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CTextFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkThem = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: CTextTheme.darkTextTheme,
    elevatedButtonTheme: CElevatedButton.darkElevatedButtonTheme,
    appBarTheme: CAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: CBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: CCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: CChipTheme.darkChipTheme,
    outlinedButtonTheme: COutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CTextFieldTheme.darkInputDecorationTheme,
  );
}

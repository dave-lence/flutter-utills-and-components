import 'package:flutter/material.dart';

class CChipTheme {
  CChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    selectedColor: Colors.blue,
    disabledColor: Colors.grey.withOpacity(0.4),
    checkmarkColor: Colors.white,
    labelStyle: const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
      selectedColor: Colors.blue,
      disabledColor: Colors.grey,
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12));
}

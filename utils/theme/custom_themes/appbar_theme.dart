import 'package:flutter/material.dart';

class CAppBarTheme {
  CAppBarTheme._();

  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle:false,
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 24
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
      size: 24
    ),
    titleTextStyle:  TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static AppBarTheme darkAppBarTheme = const AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    actionsIconTheme: IconThemeData(
      color: Colors.black,
      size: 24
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 24
    ),
    titleTextStyle:  TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
  useMaterial3: true,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
    selectionHandleColor: Colors.lightBlue,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    focusColor: Colors.white,
    fillColor: Colors.transparent,
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white70),
    ),
    activeIndicatorBorder: BorderSide(color: Colors.white),
    labelStyle: TextStyle(color: Colors.white),
    hintStyle: TextStyle(color: Colors.white),
  ),
);

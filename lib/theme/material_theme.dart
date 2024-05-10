import 'package:flutter/material.dart';

class MaterialTheme {

  static final lightTheme = ThemeData.light().copyWith(
      brightness: Brightness.light
  );
  static final darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark
  );

}
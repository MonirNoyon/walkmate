import 'dart:io';

import 'package:flutter/material.dart';
import 'package:walkmate/resources/color_manager.dart';

import '../../resources/font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    primaryColorDark: Colors.black,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.transparent
    ),
    useMaterial3: true,
    // useMaterial3: Platform.isAndroid ? true : false,
  );
}

ThemeData getApplicationDarkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.dark,
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    primaryColorLight: Colors.black,
    primaryColorDark: Colors.black,
    indicatorColor: Colors.white,
    useMaterial3: true,
    // useMaterial3: Platform.isAndroid ? true : false,
  );
}

import 'package:flutter/material.dart';

class ThemePref {
  static const String lightTheme = "LightTheme";
  static const String darkTheme = "DarkTheme";
  static const String deepOrangeThemeLight = "DeepOrangeThemeLight";
  static const String deepPurpleThemeLight = "DeepPurpleThemeLight";

  static List<String> themePrefList = [
    "LightTheme",
    "DarkTheme",
    "DeepOrangeThemeLight",
    "DeepPurpleThemeLight",
  ];
}

final appThemeData = {
  ThemePref.lightTheme: ThemeData(
    brightness: Brightness.light,
  ),

  ThemePref.darkTheme: ThemeData(
    brightness: Brightness.dark,
  ),

  ThemePref.deepOrangeThemeLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepOrange,
    primarySwatch: Colors.deepOrange,
  ),

  ThemePref.deepPurpleThemeLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    primarySwatch: Colors.deepPurple,
  ),
};
import 'package:flutter/material.dart';
import 'package:flutterreduxdemo/comment/Global.dart';

class ThemeModel {
  ColorSwatch theme;

  ThemeModel({required this.theme});

  int get themeIndex => Global.themes.indexOf(theme as MaterialColor);
}

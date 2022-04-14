import 'package:flutter/material.dart';
import 'package:flutterreduxdemo/comment/Global.dart';
import 'package:flutterreduxdemo/model/Profile_Model.dart';

class ThemeModel {
  ColorSwatch theme;
  ProfileModel profileModel;

  ThemeModel({required this.theme, required this.profileModel});

  int get themeIndex => Global.themes.indexOf(theme as MaterialColor);

  void saveTheme() {
    profileModel.profile.theme = theme[500]!.value;
    Global.saveProfile();
  }
}

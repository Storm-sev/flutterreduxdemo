import 'package:flutter/material.dart';
import 'package:flutterreduxdemo/comment/Global.dart';
import 'package:flutterreduxdemo/model/Profile_Model.dart';
import 'package:flutterreduxdemo/model/ThemeModel.dart';
import 'package:flutterreduxdemo/model/UserModel.dart';
import 'package:flutterreduxdemo/models/index.dart';
import 'package:flutterreduxdemo/action/SetThemeAction.dart';

class AppState {
  UserModel? userState;
  ThemeModel? themeState;
  ProfileModel? profileState;

  Profile get _profile => Profile();

  AppState({this.userState, this.themeState});

  ColorSwatch get theme =>
      Global.themes.firstWhere((element) => _profile.theme == element.value,
          orElse: () => Colors.blue);

  // 当前主题位置.
  int get themeIndex => Global.themes.indexOf(theme as MaterialColor);

  AppState.initialState() {
    // 初始化状态
    profileState = ProfileModel(profile: _profile);
    themeState = ThemeModel(theme: theme);
  }
}

AppState appReducer(AppState state, action){
  return AppState(themeState: ThemeReducer(state.themeState,action));

}

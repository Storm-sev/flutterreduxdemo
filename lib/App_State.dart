import 'package:flutter/material.dart';
import 'package:flutterreduxdemo/action/SetUserAction.dart';
import 'package:flutterreduxdemo/comment/Global.dart';
import 'package:flutterreduxdemo/model/Profile_Model.dart';
import 'package:flutterreduxdemo/model/Theme_Model.dart';
import 'package:flutterreduxdemo/model/UserModel.dart';
import 'package:flutterreduxdemo/models/index.dart';
import 'package:flutterreduxdemo/action/SetThemeAction.dart';

class AppState {
  late UserModel userState;
  late ThemeModel themeState;
  late ProfileModel profileState;

  Profile get _profile => Global.profile;

  AppState({required this.userState, required this.themeState});

  AppState.initialState() {
    // 初始化状态
    profileState = ProfileModel(profile: _profile);
    ColorSwatch theme = Global.themes.firstWhere(
        (element) => profileState.profile.theme == element.value,
        orElse: () => Colors.blue);
    themeState = ThemeModel(theme: theme);
    //初始化用户信息.
    userState =
        UserModel(user: profileState.profile.user, profileModel: profileState);
  }
}

AppState appReducer(AppState state, action) {
  return AppState(
      themeState: ThemeReducer(state.themeState, action),
      userState: UserReducer(state.userState, action));
}

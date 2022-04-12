import 'package:flutter/material.dart';
import 'package:flutterreduxdemo/model/ThemeModel.dart';
import 'package:redux/redux.dart';

class SetThemeAction {
  ColorSwatch? theme;

  SetThemeAction({this.theme}) : super();

  static ThemeModel? setTheme(ThemeModel? model, SetThemeAction action) {
    model?.theme = action?.theme;
    return model;
  }
}

// 绑定action 和动作
final ThemeReducer = combineReducers<ThemeModel>([
  TypedReducer<ThemeModel, SetThemeAction>(SetThemeAction.setheme),
]);

import 'package:flutter/material.dart';
import 'package:flutterreduxdemo/model/Theme_Model.dart';
import 'package:redux/redux.dart';

class SetThemeAction {
  ColorSwatch theme;

  SetThemeAction({required this.theme}) : super();

  static ThemeModel setTheme(ThemeModel model, SetThemeAction action) {
    if(model.theme != action.theme) {
      model.theme = action.theme;
      model.saveTheme();
    }

    return model;
  }
}

// 绑定action 和动作
final ThemeReducer = combineReducers<ThemeModel>([
  TypedReducer<ThemeModel, SetThemeAction>(SetThemeAction.setTheme),
]);

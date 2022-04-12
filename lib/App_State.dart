import 'package:flutterreduxdemo/model/ThemeModel.dart';
import 'package:flutterreduxdemo/model/UserModel.dart';

class AppState {
  UserModel? userModel;
  ThemeModel? theme;

  AppState({this.userModel, this.theme});

  AppState.initialState() {
    // 初始化状态
    

  }
}

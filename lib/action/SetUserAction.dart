import 'package:flutterreduxdemo/model/UserModel.dart';
import 'package:flutterreduxdemo/models/index.dart';
import 'package:redux/redux.dart';

class SetUserAction {
  User user;

  SetUserAction({required this.user});

  static UserModel setUser(UserModel userModel, SetUserAction action) {
    if (userModel.user == null) {
      userModel.user = action.user;
    } else {
      if (action.user.login != userModel.user!.login) {
        userModel.profileModel.profile.lastLogin = action.user.login;
        userModel.user = action.user;
        userModel.saveUser();
      }
    }

    return userModel;
  }
// userModel.user = action.user;
}

// 绑定 action 和 model
final UserReducer = combineReducers<UserModel>([
  TypedReducer<UserModel, SetUserAction>(SetUserAction.setUser),
]);

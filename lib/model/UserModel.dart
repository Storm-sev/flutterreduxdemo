import 'package:flutterreduxdemo/comment/Global.dart';
import 'package:flutterreduxdemo/model/Profile_Model.dart';

import '../models/user.dart';

class UserModel {
  User? user;

  ProfileModel profileModel;

  UserModel({this.user, required this.profileModel});

  void saveUser() {
    profileModel.profile.user = user;
    Global.saveProfile();
  }

}

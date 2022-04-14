import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterreduxdemo/App_State.dart';
import 'package:flutterreduxdemo/comment/Theme_color.dart';
import 'package:flutterreduxdemo/models/index.dart';
import 'package:list_tile_more_customizable/list_tile_more_customizable.dart';
import 'package:redux/redux.dart';

import '../comment/CommentWidget.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Widget _buildMenus() {
    return ListView(
      children: [
        ListTileMoreCustomizable(
          dense: true,
          leading: const Icon(
            Icons.color_lens,
          ),
          title: const Text(
            "S.of(context).title_lens",
            style: const TextStyle(color: Colors.grey),
          ),
          onTap: (v) {
            // 跳转 换肤
            Navigator.of(context).pushNamed("theme");
          },
        ),

      ],
    );
  }

  // 头部信息
  Widget _buildHeaders(_ViewModel vm) {
    return GestureDetector(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipOval(
                    child: vm.isLogin
                        ? gmAvatar(vm.user!.avatar_url, width: 80)
                        : Image.asset(
                            "images/ic_header_default.png",
                            width: 80,
                          )),
              ),
              Text(
                "未登录",
                style: TextStyle(color: custThemes[vm.themeIndex].titleColor),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed('login');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        builder: (context, vm) {
          return Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaders(vm),
                Expanded(child: _buildMenus()),
              ],
            ),
          );
        },
        converter: (store) => _ViewModel.create(store));
  }
}

class _ViewModel {
  User? user;

  bool get isLogin => user != null;
  late int themeIndex = 0;

  _ViewModel({this.user, required this.themeIndex});

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
        user: store.state.userState.user,
        themeIndex: store.state.themeState.themeIndex);
  }
}

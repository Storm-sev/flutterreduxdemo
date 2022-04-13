import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterreduxdemo/App_State.dart';
import 'package:flutterreduxdemo/models/index.dart';
import 'package:redux/redux.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        builder: (context, vm) {
          return Text("测试");
        },
        converter: (store) => _ViewModel.create(store));
  }
}

class _ViewModel {
  User? user;

  _ViewModel({this.user});

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel();
  }
}

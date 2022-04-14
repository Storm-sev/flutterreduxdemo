import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterreduxdemo/App_State.dart';
import 'package:flutterreduxdemo/action/SetThemeAction.dart';
import 'package:flutterreduxdemo/comment/Global.dart';
import 'package:redux/redux.dart';

class ThemeChangeRouter extends StatefulWidget {
  const ThemeChangeRouter({Key? key}) : super(key: key);

  @override
  State<ThemeChangeRouter> createState() => _ThemeChangeRouterState();
}

class _ThemeChangeRouterState extends State<ThemeChangeRouter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("主题换肤"),
      ),
      body: StoreConnector<AppState, _ViewModel>(
        builder: (context, vm) {
          return ListView(
            children: Global.themes.map<Widget>((e) {
              return GestureDetector(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Container(
                    color: e,
                    height: 40,
                  ),
                ),
                onTap: () {
                  print("获取的e --> ${e}");
                  vm.onSetThemeData!(e);
                },
              );
            }).toList(),
          );
        },
        converter: (store) => _ViewModel.create(store),
      ),
    );
  }
}

class _ViewModel {
  late int themeIndex;
  Function(ColorSwatch)? onSetThemeData;

  _ViewModel({required this.themeIndex, this.onSetThemeData});

  factory _ViewModel.create(Store<AppState> store) {
    _onSetThemeData(ColorSwatch theme) {
      store.dispatch(SetThemeAction(theme: theme));
    }

    return _ViewModel(
        themeIndex: store.state.themeState.themeIndex,
        onSetThemeData: _onSetThemeData);
  }
}

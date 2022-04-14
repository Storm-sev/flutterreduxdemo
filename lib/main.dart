import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterreduxdemo/App_State.dart';
import 'package:flutterreduxdemo/comment/Global.dart';
import 'package:flutterreduxdemo/router/MyDrawer.dart';
import 'package:flutterreduxdemo/router/Theme_router.dart';
import 'package:redux/redux.dart';

import 'models/repo.dart';

void main() => Global.init().then((value) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store =
    Store<AppState>(appReducer, initialState: AppState.initialState());
    return StoreProvider(
        store: store,
        child: StoreBuilder<AppState>(builder: (context, store) {
          return MaterialApp(
            title: 'flutter demo',
            theme: ThemeData(
                primarySwatch: store.state.themeState.theme as MaterialColor),
            home: const HomeRouter(),
            routes: {
              "theme": (context) => ThemeChangeRouter(),
            },
          );
        }));
  }
}

class HomeRouter extends StatefulWidget {
  const HomeRouter({Key? key}) : super(key: key);

  @override
  State<HomeRouter> createState() => _HomeRouterState();
}

class _HomeRouterState extends State<HomeRouter> {
  static const String loading=  "##-loading-##";
  var items = <Repo>[Repo()..name = loading];
  bool hasMore = true;
  int page =1;
  Widget line = const Divider(color: Colors.black,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer(),
      appBar: AppBar(
        title: const Text('title 首页'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('测试环境 获取的是当前哪个 index'),
            StoreConnector<AppState, _ViewModel>(builder: (context, viewModel) {
              return  Text("${viewModel.index!}");
            }, converter: (store) => _ViewModel.create(store)),
          ],
        ),
      ),
    );
  }

}

class _ViewModel {
   int? index;
  _ViewModel({this.index});
  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(index: store.state.themeState.themeIndex);
  }
}





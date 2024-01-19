import 'package:atm_architecture/navigator_observer.dart';
import 'package:atm_architecture/app_routes.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  final GlobalKey<NavigatorState> _navigatorKey;
  final GlobalRouteObserver _globalRouteObserver;
  const App(this._globalRouteObserver, this._navigatorKey, {super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [widget._globalRouteObserver],
      navigatorKey: widget._navigatorKey,
      title: "ATM",
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}

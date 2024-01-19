import 'package:atm_architecture/app.dart';
import 'package:atm_architecture/app_module.dart';
import 'package:atm_architecture/navigator_observer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void main() {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final GlobalRouteObserver globalRouteObserver = GlobalRouteObserver();

  AppModule(globalRouteObserver, navigatorKey).configure();

  runApp(App(globalRouteObserver, navigatorKey));
}

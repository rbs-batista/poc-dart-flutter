import 'package:atm_architecture/commons/modules/controllers_module.dart';
import 'package:atm_architecture/commons/modules/infrastructures_module.dart';
import 'package:atm_architecture/commons/modules/repositories_module.dart';
import 'package:atm_architecture/commons/modules/services_module.dart';
import 'package:atm_architecture/commons/modules/views_module.dart';
import 'package:atm_architecture/navigator_observer.dart';
import 'package:atm_architecture/route_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class AppModule {
  final GlobalKey<NavigatorState> _globalKey;
  final GlobalRouteObserver _globalRouteObserver;

  AppModule(this._globalRouteObserver, this._globalKey);

  void configure() {
    InfrastructuresModule().configure();
    RepositoriesModule().configure();
    ServicesModule().configure();
    ControllersModule().configure();
    ViewsModule().configure();

    getIt
      ..registerLazySingleton<IRouteNavigator>(
          () => RouteNavigator(_globalRouteObserver, navigatorKey: _globalKey));
  }
}

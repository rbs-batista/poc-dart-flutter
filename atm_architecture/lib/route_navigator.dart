import 'package:atm_architecture/navigator_observer.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

abstract class IRouteNavigator {
  Future<T?> pushNamed<T extends Object>(String routeName, {Object? arguments});
  void pop<T extends Object>([T? result]);
}

class RouteNavigator extends BlocBase implements IRouteNavigator {
  final GlobalKey<NavigatorState> navigatorKey;
  final GlobalRouteObserver _globalRouteObserver;

  RouteNavigator(this._globalRouteObserver, {required this.navigatorKey});

  @override
  Future<T?> pushNamed<T extends Object>(String routeName,
      {Object? arguments}) async {
    return await navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  void pop<T extends Object>([T? result]) {
    navigatorKey.currentState?.pop(result);
  }

  String? currentRoute() => _globalRouteObserver.currentRoute;
}

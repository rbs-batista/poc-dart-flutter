import 'package:atm_architecture/presenters/controllers/home_controller.dart';
import 'package:atm_architecture/presenters/controllers/withdrawal_controller.dart';
import 'package:atm_architecture/presenters/view/home_view.dart';
import 'package:atm_architecture/presenters/view/withdrawal_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class AppRoutes {
  static const String home = "/home";
  static const String withdrawal = "/withdrawal";

  static GetIt getIt = GetIt.I;

  static Map<String, WidgetBuilder> get routes => {
        home: (_) => HomeView(getIt.get<IHomeController>()),
        withdrawal: (_) => WithdrawalView(getIt.get<IWithdrawalController>())
      };
}

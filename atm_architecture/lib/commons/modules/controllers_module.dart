import 'package:atm_architecture/presenters/controllers/home_controller.dart';
import 'package:atm_architecture/presenters/controllers/withdrawal_controller.dart';
import 'package:get_it/get_it.dart';

class ControllersModule {
  ControllersModule();

  final GetIt getIt = GetIt.instance;

  void configure() {
    getIt
      ..registerFactory<IHomeController>(() => HomeController(getIt()))
      ..registerFactory<IWithdrawalController>(
          () => WithdrawalController(getIt()));
  }
}

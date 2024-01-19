import 'package:atm_architecture/presenters/view/home_view.dart';
import 'package:atm_architecture/presenters/view/withdrawal_view.dart';
import 'package:get_it/get_it.dart';

class ViewsModule {
  ViewsModule();

  final GetIt getIt = GetIt.instance;

  void configure() {
    getIt
      ..registerFactory(() => HomeView(getIt()))
      ..registerFactory(() => WithdrawalView(getIt()));
  }
}

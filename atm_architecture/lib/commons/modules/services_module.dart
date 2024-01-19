import 'package:atm_architecture/domain/services/withdrawal_service.dart';
import 'package:get_it/get_it.dart';

class ServicesModule {
  ServicesModule();

  final GetIt getIt = GetIt.instance;

  void configure() {
    getIt
      ..registerFactory<IWithdrawalService>(() => WithdrawalService(getIt()));
  }
}

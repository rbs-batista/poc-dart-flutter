import 'package:atm_architecture/data/repositories/withdrawal_repository.dart';
import 'package:get_it/get_it.dart';

class RepositoriesModule {
  RepositoriesModule();

  final GetIt getIt = GetIt.instance;

  void configure() {
    getIt
      ..registerFactory<IWithdrawalRepository>(
          () => WithdrawalRepository(getIt()));
  }
}

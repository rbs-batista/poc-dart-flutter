import 'package:atm_architecture/infrastructure/baas_api.dart';
import 'package:get_it/get_it.dart';

class InfrastructuresModule {
  InfrastructuresModule();

  final GetIt getIt = GetIt.instance;

  void configure() {
    getIt..registerFactory<IBaasApi>(() => BaasApi());
  }
}

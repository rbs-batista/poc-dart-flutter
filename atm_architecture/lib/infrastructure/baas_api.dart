import 'package:atm_architecture/commons/extensions/map_extension.dart';

abstract class IBaasApi {
  Future<String> getAvailableBanknotes();
}

class BaasApi implements IBaasApi {
  @override
  Future<String> getAvailableBanknotes() async {
    final Map<String, dynamic> banknotes = {
      "banknotes": [200, 100, 50, 20, 10, 5, 2]
    };

    Future.delayed(const Duration(seconds: 2));
    return banknotes.serialize();
  }
}

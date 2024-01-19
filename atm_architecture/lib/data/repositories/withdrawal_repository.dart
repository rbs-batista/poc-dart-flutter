import 'package:atm_architecture/commons/dtos/banknote_dto.dart';
import 'package:atm_architecture/commons/extensions/string_extension.dart';
import 'package:atm_architecture/data/models/banknote_model.dart';
import 'package:atm_architecture/infrastructure/baas_api.dart';

abstract class IWithdrawalRepository {
  Future<BanknoteDto> fetchBanknotes();
}

class WithdrawalRepository implements IWithdrawalRepository {
  final IBaasApi _bank;

  WithdrawalRepository(this._bank);

  @override
  Future<BanknoteDto> fetchBanknotes() async {
    String banknotes = await _bank.getAvailableBanknotes();

    BanknoteModel banknoteModel =
        BanknoteModel.fromJson(banknotes.deserialize());

    return banknoteModel.toDto;
  }
}

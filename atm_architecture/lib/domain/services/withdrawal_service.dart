import 'package:atm_architecture/commons/dtos/banknote_dto.dart';
import 'package:atm_architecture/commons/dtos/withdrawal_dto.dart';
import 'package:atm_architecture/data/repositories/withdrawal_repository.dart';
import 'package:atm_architecture/domain/entities/withdrawal_entity.dart';

abstract class IWithdrawalService {
  Future<WithdrawalDto> getCash({required int amount});
}

class WithdrawalService implements IWithdrawalService {
  final IWithdrawalRepository _withdrawalRepository;

  WithdrawalService(this._withdrawalRepository);

  @override
  Future<WithdrawalDto> getCash({required int amount}) async {
    BanknoteDto banknotes = await _withdrawalRepository.fetchBanknotes();

    WithdrawalEntity withdrawalEntity =
        WithdrawalEntity(amount: amount, banknotes: banknotes.banknotes);

    withdrawalEntity.calculateQuantityByBanknote();

    return withdrawalEntity.toDto;
  }
}

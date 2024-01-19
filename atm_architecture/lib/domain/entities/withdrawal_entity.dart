import 'package:atm_architecture/commons/dtos/withdrawal_dto.dart';

class WithdrawalEntity {
  int amount;
  final List banknotes;
  Map<int, int> quantityByBanknote;

  WithdrawalEntity({required this.amount, required this.banknotes})
      : quantityByBanknote = {};

  void calculateQuantityByBanknote() {
    for (int banknote in banknotes) {
      if (amount >= banknote) {
        int total = amount - banknote;

        while (total > 3 || total == 2 || total == 0) {
          quantityByBanknote[banknote] ??= 0;
          quantityByBanknote[banknote] = quantityByBanknote[banknote]! + 1;
          amount -= banknote;
          total -= banknote;
        }
      }
    }
  }

  WithdrawalDto get toDto => WithdrawalDto(
        quantityByBanknote: quantityByBanknote,
      );
}

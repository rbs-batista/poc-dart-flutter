import 'package:atm_architecture/commons/dtos/withdrawal_dto.dart';

class WithdrawalState {
  final bool loading;
  final String? state;
  final WithdrawalDto? withdrawal;

  WithdrawalState({required this.loading, this.state, this.withdrawal});
}

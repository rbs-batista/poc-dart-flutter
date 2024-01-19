import 'package:atm_architecture/presenters/states/base_state.dart';

class WithdrawalState extends BaseState implements IState {
  //final WithdrawalDto? withdrawal;

  WithdrawalState({super.isLoading, super.state, super.data});
}

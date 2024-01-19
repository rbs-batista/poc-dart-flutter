import 'package:atm_architecture/commons/dtos/withdrawal_dto.dart';
import 'package:atm_architecture/domain/services/withdrawal_service.dart';
import 'package:atm_architecture/presenters/controllers/base_controller.dart';
import 'package:atm_architecture/presenters/states/base_state.dart';
import 'package:atm_architecture/presenters/states/withdrawal_state.dart';

abstract class IWithdrawalController {
  Future<void> load();
  Future<void> toWithdraw({required int amount});
  void dispose();
  Stream<IState> get onStream;
}

class WithdrawalController extends BaseController
    implements IWithdrawalController {
  final IWithdrawalService _withdrawalService;

  WithdrawalController(this._withdrawalService) : super(WithdrawalState());

  @override
  Future<void> load() async {
    emit(WithdrawalState(isLoading: true, state: "Carregando..."));

    await Future.delayed(const Duration(seconds: 1));

    emit(WithdrawalState(isLoading: false));
  }

  @override
  Future<void> toWithdraw({required int amount}) async {
    emit(WithdrawalState(isLoading: true, state: "Carregando..."));

    WithdrawalDto withdrawal = await _withdrawalService.getCash(amount: amount);

    emit(WithdrawalState(isLoading: false, data: withdrawal));
  }
}

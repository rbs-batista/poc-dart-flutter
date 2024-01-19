import 'package:atm_architecture/commons/dtos/withdrawal_dto.dart';
import 'package:atm_architecture/domain/services/withdrawal_service.dart';
import 'package:atm_architecture/presenters/controllers/base_controller.dart';
import 'package:atm_architecture/presenters/states/withdrawal_state.dart';
import 'package:rxdart/subjects.dart';

abstract class IWithdrawalController {
  Future<void> load();
  Future<void> toWithdraw({required int amount});
  void dispose();
  Stream<WithdrawalState> get onStream;
}

class WithdrawalController extends BaseController
    implements IWithdrawalController {
  final _stateController = PublishSubject<WithdrawalState>();
  final IWithdrawalService _withdrawalService;

  WithdrawalController(this._withdrawalService);

  @override
  Future<void> load() async {
    _stateController
        .add(WithdrawalState(loading: true, state: "Carregando..."));

    await Future.delayed(const Duration(seconds: 1));

    _stateController.add(WithdrawalState(loading: false));
  }

  @override
  Future<void> toWithdraw({required int amount}) async {
    _stateController
        .add(WithdrawalState(loading: true, state: "Carregando..."));

    WithdrawalDto withdrawal = await _withdrawalService.getCash(amount: amount);

    _stateController
        .add(WithdrawalState(loading: false, withdrawal: withdrawal));
  }

  @override
  Stream<WithdrawalState> get onStream => _stateController.stream;

  @override
  void dispose() {
    _stateController.close();
    super.dispose();
  }
}

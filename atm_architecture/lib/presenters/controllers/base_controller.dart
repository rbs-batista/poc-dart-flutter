import 'package:atm_architecture/presenters/states/base_state.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';

class BaseController extends BlocBase {
  final IState state;
  BaseController(this.state);
  final _stateController = PublishSubject<IState>();

  Stream<IState> get onStream => _stateController.stream;

  @override
  void dispose() {
    _stateController.close();
    super.dispose();
  }

  void emit(IState state) => _stateController.add(state);
}

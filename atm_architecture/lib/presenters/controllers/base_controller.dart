import 'package:atm_architecture/presenters/states/base_state.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';

class BaseController extends BlocBase {
  final IState state;
  BaseController(this.state);
  final stateController = PublishSubject<IState>();

  Stream<IState> get onStream => stateController.stream;

  @override
  void dispose() {
    stateController.close();
    super.dispose();
  }
}

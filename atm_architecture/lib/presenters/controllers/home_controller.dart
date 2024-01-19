import 'package:atm_architecture/app_routes.dart';
import 'package:atm_architecture/presenters/controllers/base_controller.dart';
import 'package:atm_architecture/presenters/states/home_state.dart';
import 'package:atm_architecture/route_navigator.dart';
import 'package:rxdart/subjects.dart';

abstract class IHomeController {
  Future<void> load();
  Stream<HomeState> get onStream;
  Future<void> navigateToWithdrawal();
  void dispose();
}

class HomeController extends BaseController implements IHomeController {
  final _stateController = PublishSubject<HomeState>();
  final IRouteNavigator _navigator;

  HomeController(this._navigator);

  @override
  Future<void> navigateToWithdrawal() async =>
      _navigator.pushNamed(AppRoutes.withdrawal);

  @override
  Future<void> load() async {
    _stateController.add(HomeState(loading: true, state: "Carregando..."));

    await Future.delayed(const Duration(seconds: 1));

    _stateController.add(HomeState(loading: false));
  }

  @override
  Stream<HomeState> get onStream => _stateController.stream;
}

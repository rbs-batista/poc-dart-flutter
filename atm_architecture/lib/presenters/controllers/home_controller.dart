import 'package:atm_architecture/app_routes.dart';
import 'package:atm_architecture/presenters/controllers/base_controller.dart';
import 'package:atm_architecture/presenters/states/base_state.dart';
import 'package:atm_architecture/presenters/states/home_state.dart';
import 'package:atm_architecture/route_navigator.dart';

abstract class IHomeController {
  Future<void> load();
  Future<void> navigateToWithdrawal();
  void dispose();
  Stream<IState> get onStream;
}

class HomeController extends BaseController implements IHomeController {
  final IRouteNavigator _navigator;

  HomeController(this._navigator) : super(HomeState());

  @override
  Future<void> navigateToWithdrawal() async =>
      _navigator.pushNamed(AppRoutes.withdrawal);

  @override
  Future<void> load() async {
    emit(HomeState(isLoading: true, state: "Carregando..."));

    await Future.delayed(const Duration(seconds: 1));

    emit(HomeState(isLoading: false));
  }
}

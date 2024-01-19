abstract class IState {
  bool get isLoading;
  String get state;
  dynamic get data;
  startLoading();
}

class BaseState implements IState {
  @override
  bool isLoading;
  @override
  String state;
  @override
  dynamic data;

  BaseState({this.isLoading = false, this.state = "", this.data});

  @override
  startLoading({String? state}) {
    BaseState(isLoading: true, state: state ?? "Carregando...");
  }
}

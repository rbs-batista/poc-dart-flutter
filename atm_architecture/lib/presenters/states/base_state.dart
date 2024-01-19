abstract class IState {
  bool get isLoading;
  String get state;
  dynamic get data;
}

class BaseState implements IState {
  @override
  final bool isLoading;
  @override
  final String state;
  @override
  dynamic data;

  BaseState({this.isLoading = false, this.state = "", this.data});
}

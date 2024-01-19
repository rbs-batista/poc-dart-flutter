import 'package:atm_architecture/presenters/controllers/home_controller.dart';
import 'package:atm_architecture/presenters/states/home_state.dart';
import 'package:atm_architecture/presenters/view/components/default_scaffold_component.dart';
import 'package:atm_architecture/presenters/view/components/floating_action_button_large_component.dart';
import 'package:atm_architecture/presenters/view/components/grid_button_component.dart';
import 'package:atm_architecture/presenters/view/components/loading_component.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomeView extends StatefulWidget {
  final IHomeController _controller;

  const HomeView(this._controller, {Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget._controller.load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffoldComponent(
      title: "Home",
      body: StreamBuilder<HomeState>(
        stream: widget._controller.onStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.loading) {
              return LoadingComponent(state: snapshot.data!.state ?? "");
            }

            return GridButtonComponent(
              buttons: [
                FloatingActionButtonLargeComponent(
                  actions: () => widget._controller.navigateToWithdrawal(),
                  icon: Icons.shortcut,
                  label: "Sacar",
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

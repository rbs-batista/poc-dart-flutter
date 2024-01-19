import 'dart:math';

import 'package:atm_architecture/presenters/controllers/withdrawal_controller.dart';
import 'package:atm_architecture/presenters/states/base_state.dart';
import 'package:atm_architecture/presenters/view/components/default_scaffold_component.dart';
import 'package:atm_architecture/presenters/view/components/loading_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class WithdrawalView extends StatefulWidget {
  final IWithdrawalController _controller;

  const WithdrawalView(this._controller, {Key? key}) : super(key: key);

  @override
  State<WithdrawalView> createState() => _WithdrawalViewState();
}

class _WithdrawalViewState extends State<WithdrawalView> with BanknoteToList {
  final int amount = Random().nextInt(200);

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget._controller.load();
    });
  }

  @override
  void dispose() {
    widget._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffoldComponent(
      title: "Saque",
      body: StreamBuilder<IState>(
        stream: widget._controller.onStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isLoading) {
              return LoadingComponent(state: snapshot.data!.state);
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Valor do saque',
                ),
                Text(
                  amount.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                const Divider(),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      banknote(snapshot.data!.data?.quantityByBanknote ?? {})
                          .length,
                  itemBuilder: (context, index) => banknote(
                      snapshot.data!.data?.quantityByBanknote ?? {})[index],
                ),
              ],
            );
          }
          return Container();
        },
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            FloatingActionButton(
              onPressed: () => widget._controller.toWithdraw(amount: amount),
              tooltip: 'Sacar',
              child: const Icon(Icons.attach_money),
            ),
          ],
        ),
      ),
    );
  }
}

mixin BanknoteToList {
  List<Widget> banknote(Map<int, int> banknote) {
    return banknote.entries.map(
      (entry) {
        return ListTile(
          title: Text(
              "${entry.value} nota${entry.value > 1 ? "s" : ""} de ${entry.key}"),
        );
      },
    ).toList();
  }
}

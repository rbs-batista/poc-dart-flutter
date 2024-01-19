import 'package:flutter/material.dart';

class GridButtonComponent extends StatelessWidget {
  final List<Widget> buttons;
  const GridButtonComponent({required this.buttons, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons,
      ),
    );
  }
}

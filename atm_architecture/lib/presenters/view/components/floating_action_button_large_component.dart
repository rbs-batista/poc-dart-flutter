import 'package:flutter/material.dart';

class FloatingActionButtonLargeComponent extends StatelessWidget {
  final VoidCallback? actions;
  final String label;
  final IconData icon;
  const FloatingActionButtonLargeComponent({
    required this.actions,
    required this.label,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FloatingActionButton.large(
          heroTag: label,
          onPressed: actions,
          child: Icon(icon),
        ),
        const SizedBox(height: 20),
        Text(
          label,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

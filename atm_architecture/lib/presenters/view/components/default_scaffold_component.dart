import 'package:flutter/material.dart';

class DefaultScaffoldComponent extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;

  const DefaultScaffoldComponent({
    required this.title,
    required this.body,
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        centerTitle: true,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}

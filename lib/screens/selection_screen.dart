import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  final String title;
  final Widget child;

  const SelectionScreen({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
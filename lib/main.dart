import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SelectionDemoApp());
}

class SelectionDemoApp extends StatelessWidget {
  const SelectionDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selection Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
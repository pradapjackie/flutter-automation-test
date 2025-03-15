import 'package:flutter/material.dart';
import 'widgets/checkbox_selection.dart';
import 'widgets/radio_selection.dart';
// Import other widgets

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Widget Test Viewer')),
      body: ListView(
        children: [
          CheckboxSelection(),
          Divider(height: 20),
          RadioSelection(),
          // Add other widgets
        ],
      ),
    ),
  ));
}
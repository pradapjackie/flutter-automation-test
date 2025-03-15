import 'package:flutter/cupertino.dart';

class SelectionOption {
  final String title;
  final String description;
  final String routeName;
  final IconData icon;

  const SelectionOption({
    required this.title,
    required this.description,
    required this.routeName,
    required this.icon,
  });
}

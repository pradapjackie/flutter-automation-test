import 'package:flutter/material.dart';
import '../utils/keys.dart';

class ToggleSelection extends StatefulWidget {
  const ToggleSelection({Key? key}) : super(key: key);

  @override
  ToggleSelectionState createState() => ToggleSelectionState();
}

class ToggleSelectionState extends State<ToggleSelection> {
  bool _isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: AppKeys.toggleSelectionScreen,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Toggle dark mode:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Light Mode'),
            Switch(
              key: AppKeys.toggleSwitch,
              value: _isToggled,
              onChanged: (bool value) {
                setState(() {
                  _isToggled = value;
                });
              },
            ),
            const Text('Dark Mode'),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Current mode: ${_isToggled ? "Dark Mode" : "Light Mode"}',
          key: AppKeys.toggleStatus,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
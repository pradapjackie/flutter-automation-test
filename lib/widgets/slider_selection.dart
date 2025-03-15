import 'package:flutter/material.dart';
import '../utils/keys.dart';

class SliderSelection extends StatefulWidget {
  const SliderSelection({Key? key}) : super(key: key);

  @override
  SliderSelectionState createState() => SliderSelectionState();
}

class SliderSelectionState extends State<SliderSelection> {
  double _currentValue = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: AppKeys.sliderSelectionScreen,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select a value:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Slider(
          key: AppKeys.sliderWidget,
          value: _currentValue,
          min: 0,
          max: 100,
          divisions: 100,
          label: _currentValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentValue = value;
            });
          },
        ),
        const SizedBox(height: 24),
        Text(
          'Selected value: ${_currentValue.round()}',
          key: AppKeys.sliderValueText,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
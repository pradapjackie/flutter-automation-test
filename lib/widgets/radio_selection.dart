import 'package:flutter/material.dart';
import '../utils/keys.dart';

class RadioSelection extends StatefulWidget {
  const RadioSelection({super.key});

  @override
  RadioSelectionState createState() => RadioSelectionState();
}

class RadioSelectionState extends State<RadioSelection> {
  final List<String> options = [
    'Red',
    'Green',
    'Blue',
    'Yellow',
    'Purple',
  ];
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: AppKeys.radioSelectionScreen,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select your favorite color:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options[index];
              return RadioListTile<String>(
                key: Key('${AppKeys.radioOption.toString()}_$index'),
                title: Text(option),
                value: option,
                groupValue: selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Selected color: ${selectedOption ?? "None"}',
          key: AppKeys.radioSelected,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

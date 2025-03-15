import 'package:flutter/material.dart';
import '../utils/keys.dart';

class CheckboxSelection extends StatefulWidget {
  const CheckboxSelection({Key? key}) : super(key: key);

  @override
  CheckboxSelectionState createState() => CheckboxSelectionState();
}

class CheckboxSelectionState extends State<CheckboxSelection> {
  final List<String> items = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
  ];
  final Set<String> selectedItems = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      key: AppKeys.checkboxSelectionScreen,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select your favorite fruits:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return CheckboxListTile(
                key: Key('${AppKeys.checkboxItem.toString()}_$index'),
                title: Text(item),
                value: selectedItems.contains(item),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selectedItems.add(item);
                    } else {
                      selectedItems.remove(item);
                    }
                  });
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Selected items: ${selectedItems.isEmpty ? "None" : selectedItems.join(", ")}',
          key: AppKeys.checkboxSelected,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          key: AppKeys.checkboxReset,
          onPressed: () {
            setState(() {
              selectedItems.clear();
            });
          },
          child: const Text('Reset Selection'),
        ),
      ],
    );
  }
}

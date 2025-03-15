import 'package:flutter/material.dart';
import '../utils/keys.dart';

class DropdownSelection extends StatefulWidget {
  const DropdownSelection({Key? key}) : super(key: key);

  @override
  DropdownSelectionState createState() => DropdownSelectionState();
}

class DropdownSelectionState extends State<DropdownSelection> {
  final List<String> countries = [
    'USA',
    'Canada',
    'UK',
    'Australia',
    'Germany',
    'France',
    'Japan',
    'India',
  ];
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: AppKeys.dropdownSelectionScreen,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select a country:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        DropdownButton<String>(
          key: AppKeys.dropdownButton,
          hint: const Text('Select a country'),
          value: selectedCountry,
          isExpanded: true,
          items: countries.map((String country) {
            return DropdownMenuItem<String>(
              key: Key('${AppKeys.dropdownItem.toString()}_$country'),
              value: country,
              child: Text(country),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedCountry = newValue;
            });
          },
        ),
        const SizedBox(height: 24),
        Text(
          'Selected country: ${selectedCountry ?? "None"}',
          key: AppKeys.dropdownSelected,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
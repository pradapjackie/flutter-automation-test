import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerSelection extends StatefulWidget {
  const DatePickerSelection({Key? key}) : super(key: key);

  @override
  State<DatePickerSelection> createState() => _DatePickerSelectionState();
}

class _DatePickerSelectionState extends State<DatePickerSelection> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String dateText = _selectedDate == null
        ? 'No date selected!'
        : 'Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}';

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            dateText,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: const Text('Select Date'),
          ),
        ],
      ),
    );
  }
}

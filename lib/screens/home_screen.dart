import 'package:flutter/material.dart';
import '../models/selection_option.dart';
import '../utils/keys.dart';
import 'selection_screen.dart';
import '../widgets/checkbox_selection.dart';
import '../widgets/radio_selection.dart';
import '../widgets/dropdown_selection.dart';
import '../widgets/slider_selection.dart';
import '../widgets/toggle_selection.dart';
import '../widgets/date_picker_selection.dart'; // Import the date picker widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controller to read text from the search field
  final TextEditingController _searchController = TextEditingController();

  // Whether we are currently in "search mode"
  bool _isSearching = false;

  // The list of options including Date Picker Selection
  final List<SelectionOption> _options = [
    const SelectionOption(
      title: 'Checkbox Selection',
      description: 'Select multiple items using checkboxes',
      routeName: '/checkbox',
      icon: Icons.check_box,
    ),
    const SelectionOption(
      title: 'Radio Selection',
      description: 'Select a single option from a list',
      routeName: '/radio',
      icon: Icons.radio_button_checked,
    ),
    const SelectionOption(
      title: 'Dropdown Selection',
      description: 'Select an item from a dropdown menu',
      routeName: '/dropdown',
      icon: Icons.arrow_drop_down_circle,
    ),
    const SelectionOption(
      title: 'Slider Selection',
      description: 'Select a value using a slider',
      routeName: '/slider',
      icon: Icons.linear_scale,
    ),
    const SelectionOption(
      title: 'Toggle Selection',
      description: 'Toggle between two states',
      routeName: '/toggle',
      icon: Icons.toggle_on,
    ),
    const SelectionOption(
      title: 'Date Picker Selection',
      description: 'Select a date using a date picker',
      routeName: '/date_picker',
      icon: Icons.calendar_today,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter the list based on the search query
    final String query = _searchController.text.toLowerCase();
    final List<SelectionOption> filteredOptions = _options.where((option) {
      final titleMatch = option.title.toLowerCase().contains(query);
      final descriptionMatch = option.description.toLowerCase().contains(query);
      return titleMatch || descriptionMatch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
          key: AppKeys.homeScreenSearchField,
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          onChanged: (value) => setState(() {}),
          autofocus: true,
        )
            : const Text('Selection Demo', key: AppKeys.homeScreenTitle),
        actions: [
          IconButton(
            key: AppKeys.homeScreenSearchIcon,
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                if (_isSearching) {
                  _searchController.clear();
                }
                _isSearching = !_isSearching;
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        key: AppKeys.homeScreenList,
        itemCount: filteredOptions.length,
        itemBuilder: (context, index) {
          final option = filteredOptions[index];
          return ListTile(
            leading: Icon(option.icon),
            title: Text(option.title),
            subtitle: Text(option.description),
            onTap: () {
              Widget screen;
              switch (option.routeName) {
                case '/checkbox':
                  screen = const CheckboxSelection();
                  break;
                case '/radio':
                  screen = const RadioSelection();
                  break;
                case '/dropdown':
                  screen = const DropdownSelection();
                  break;
                case '/slider':
                  screen = const SliderSelection();
                  break;
                case '/toggle':
                  screen = const ToggleSelection();
                  break;
                case '/date_picker':
                  screen = const DatePickerSelection();
                  break;
                default:
                  screen = const SizedBox.shrink();
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectionScreen(
                    title: option.title,
                    child: screen,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

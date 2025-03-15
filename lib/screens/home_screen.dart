import 'package:flutter/material.dart';
import '../models/selection_option.dart';
import '../utils/keys.dart';
import 'selection_screen.dart';
import '../widgets/checkbox_selection.dart';
import '../widgets/radio_selection.dart';
import '../widgets/dropdown_selection.dart';
import '../widgets/slider_selection.dart';
import '../widgets/toggle_selection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SelectionOption> options = [
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
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selection Demo', key: AppKeys.homeScreenTitle),
      ),
      body: ListView.builder(
        key: AppKeys.homeScreenList,
        itemCount: options.length,
        itemBuilder: (context, index) {
          final option = options[index];
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
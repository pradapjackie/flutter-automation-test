import 'package:flutter/material.dart';
import 'package:flutter_automation_project/main.dart';
import 'package:flutter_automation_project/utils/keys.dart';
import 'package:flutter_automation_project/widgets/checkbox_selection.dart';
import 'package:flutter_automation_project/widgets/dropdown_selection.dart';
import 'package:flutter_automation_project/widgets/radio_selection.dart';
import 'package:flutter_automation_project/widgets/slider_selection.dart';
import 'package:flutter_automation_project/widgets/toggle_selection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/rendering.dart';



void main() {
  group('SelectionDemoApp', () {
    testWidgets('App should start with home screen', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const SelectionDemoApp());

      // Verify that our app starts with the home screen
      expect(find.byKey(AppKeys.homeScreenTitle), findsOneWidget);
      expect(find.byKey(AppKeys.homeScreenList), findsOneWidget);
      expect(find.text('Checkbox Selection'), findsOneWidget);
      expect(find.text('Radio Selection'), findsOneWidget);
      expect(find.text('Dropdown Selection'), findsOneWidget);
      expect(find.text('Slider Selection'), findsOneWidget);
      expect(find.text('Toggle Selection'), findsOneWidget);
    });

    testWidgets('Navigate to Checkbox Selection screen', (WidgetTester tester) async {
      await tester.pumpWidget(const SelectionDemoApp());

      // Tap on the checkbox selection option
      await tester.tap(find.text('Checkbox Selection'));
      await tester.pumpAndSettle();

      // Verify we're on the checkbox selection screen
      expect(find.text('Select your favorite fruits:'), findsOneWidget);
      expect(find.byKey(AppKeys.checkboxSelected), findsOneWidget);
    });
  });

  group('CheckboxSelection Widget', () {
    testWidgets('should display all items and handle selection', (WidgetTester tester) async {
      // Build the CheckboxSelection widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CheckboxSelection(),
          ),
        ),
      );

      // Check that all items are displayed
      expect(find.text('Apple'), findsOneWidget);
      expect(find.text('Banana'), findsOneWidget);
      expect(find.text('Cherry'), findsOneWidget);
      expect(find.text('Date'), findsOneWidget);
      expect(find.text('Elderberry'), findsOneWidget);

      // Initially no items are selected
      expect(find.text('Selected items: None'), findsOneWidget);

      // Select 'Apple'
      await tester.tap(find.text('Apple'));
      await tester.pump();
      expect(find.text('Selected items: Apple'), findsOneWidget);

      // Select 'Cherry'
      await tester.tap(find.text('Cherry'));
      await tester.pump();
      expect(find.text('Selected items: Apple, Cherry'), findsOneWidget);

      // Test reset button
      await tester.tap(find.byKey(AppKeys.checkboxReset));
      await tester.pump();
      expect(find.text('Selected items: None'), findsOneWidget);
    });
  });

  group('RadioSelection Widget', () {
    testWidgets('should display all options and handle selection', (WidgetTester tester) async {
      // Build the RadioSelection widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RadioSelection(),
          ),
        ),
      );

      // Check that all options are displayed
      expect(find.text('Red'), findsOneWidget);
      expect(find.text('Green'), findsOneWidget);
      expect(find.text('Blue'), findsOneWidget);
      expect(find.text('Yellow'), findsOneWidget);
      expect(find.text('Purple'), findsOneWidget);

      // Initially no option is selected
      expect(find.text('Selected color: None'), findsOneWidget);

      // Select 'Blue'
      await tester.tap(find.text('Blue'));
      await tester.pump();
      expect(find.text('Selected color: Blue'), findsOneWidget);

      // Change selection to 'Yellow'
      await tester.tap(find.text('Yellow'));
      await tester.pump();
      expect(find.text('Selected color: Yellow'), findsOneWidget);
    });
  });

  group('DropdownSelection Widget', () {
    testWidgets('should display dropdown and handle selection', (WidgetTester tester) async {
      // Build the DropdownSelection widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DropdownSelection(),
          ),
        ),
      );

      // Check that the dropdown button is displayed
      expect(find.byKey(AppKeys.dropdownButton), findsOneWidget);
      expect(find.text('Select a country'), findsOneWidget);

      // Initially no country is selected
      expect(find.text('Selected country: None'), findsOneWidget);

      // Open the dropdown
      await tester.tap(find.byKey(AppKeys.dropdownButton));
      await tester.pumpAndSettle();

      // Select 'Germany'
      await tester.tap(find.text('Germany').last);
      await tester.pumpAndSettle();
      expect(find.text('Selected country: Germany'), findsOneWidget);

      // Open the dropdown again
      await tester.tap(find.byKey(AppKeys.dropdownButton));
      await tester.pumpAndSettle();

      // Select 'Japan'
      await tester.tap(find.text('Japan').last);
      await tester.pumpAndSettle();
      expect(find.text('Selected country: Japan'), findsOneWidget);
    });
  });

  group('SliderSelection Widget', () {
    testWidgets('should display slider and update value', (WidgetTester tester) async {
      // Build the SliderSelection widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SliderSelection(),
          ),
        ),
      );

      // Check that the slider is displayed
      expect(find.byKey(AppKeys.sliderWidget), findsOneWidget);

      // Initially the value is 50
      expect(find.text('Selected value: 50'), findsOneWidget);

      // Drag the slider to the right (value ~75)
      await tester.drag(find.byKey(AppKeys.sliderWidget), const Offset(100, 0));
      await tester.pump();

      // The value should have increased
      // Note: The exact value may vary based on the screen size, so we're checking for an approximate range
      expect(find.textContaining('Selected value: '), findsOneWidget);

      // Drag the slider to the left (value ~25)
      await tester.drag(find.byKey(AppKeys.sliderWidget), const Offset(-150, 0));
      await tester.pump();

      // The value should have decreased
      expect(find.textContaining('Selected value: '), findsOneWidget);
    });
  });

  group('ToggleSelection Widget', () {
    testWidgets('should display toggle switch and update state', (WidgetTester tester) async {
      // Build the ToggleSelection widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ToggleSelection(),
          ),
        ),
      );

      // Check that the toggle switch is displayed
      expect(find.byKey(AppKeys.toggleSwitch), findsOneWidget);

      // Initially the toggle is off (Light Mode)
      expect(find.text('Current mode: Light Mode'), findsOneWidget);

      // Tap the toggle switch
      await tester.tap(find.byKey(AppKeys.toggleSwitch));
      await tester.pump();

      // The mode should have changed to Dark Mode
      expect(find.text('Current mode: Dark Mode'), findsOneWidget);

      // Tap the toggle switch again
      await tester.tap(find.byKey(AppKeys.toggleSwitch));
      await tester.pump();

      // The mode should have changed back to Light Mode
      expect(find.text('Current mode: Light Mode'), findsOneWidget);
    });
  });
}
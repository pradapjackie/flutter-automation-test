import 'package:flutter/material.dart';

class AppKeys {
  // Home Screen
  static const homeScreenList = Key('home_screen_list');
  static const homeScreenTitle = Key('home_screen_title');

  // Checkbox Selection
  static const checkboxSelectionScreen = Key('checkbox_selection_screen');
  static const checkboxItem = Key('checkbox_item');
  static const checkboxSelected = Key('checkbox_selected');
  static const checkboxReset = Key('checkbox_reset');

  // Radio Selection
  static const radioSelectionScreen = Key('radio_selection_screen');
  static const radioOption = Key('radio_option');
  static const radioSelected = Key('radio_selected');

  // Dropdown Selection
  static const dropdownSelectionScreen = Key('dropdown_selection_screen');
  static const dropdownButton = Key('dropdown_button');
  static const dropdownItem = Key('dropdown_item');
  static const dropdownSelected = Key('dropdown_selected');

  // Slider Selection
  static const sliderSelectionScreen = Key('slider_selection_screen');
  static const sliderWidget = Key('slider_widget');
  static const sliderValueText = Key('slider_value_text');

  // Toggle Selection
  static const toggleSelectionScreen = Key('toggle_selection_screen');
  static const toggleSwitch = Key('toggle_switch');
  static const toggleStatus = Key('toggle_status');
}
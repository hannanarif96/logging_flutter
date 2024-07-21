import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsViewModel extends ChangeNotifier {
  static const platform = MethodChannel('com.example.settings');
  bool _darkMode = false;

  bool get darkMode => _darkMode;

  Future<void> getDarkMode() async {
    try {
      final bool result = await platform.invokeMethod('getDarkMode');
      _darkMode = result;
      notifyListeners();
    } on PlatformException catch (e) {
      print("Failed to get dark mode: '${e.message}'.");
    }
  }

  Future<void> setDarkMode(bool value) async {
    try {
      await platform.invokeMethod('setDarkMode', value);
      _darkMode = value;
      notifyListeners();
    } on PlatformException catch (e) {
      print("Failed to set dark mode: '${e.message}'.");
    }
  }
}
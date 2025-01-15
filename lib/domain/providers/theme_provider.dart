import 'package:flutter/material.dart';
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeProvider() {
    _initializeTheme();
  }
  ThemeMode get themeMode => _themeMode;

  void _initializeTheme() {
    _themeMode = ThemeMode.system;
    notifyListeners();
  }
  void toggleTheme() {
    switch (_themeMode) {
      case ThemeMode.system:
        _themeMode = ThemeMode.light;
        break;
      case ThemeMode.light:
        _themeMode = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        _themeMode = ThemeMode.system;
        break;
    }
    notifyListeners();
  }

  bool get isSystemTheme => _themeMode == ThemeMode.system;
  bool get isLightTheme => _themeMode == ThemeMode.light;
  bool get isDarkTheme => _themeMode == ThemeMode.dark;
}
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get darkMode => _isDark;

  set darkMode(bool value) {
    _isDark = value;
    notifyListeners();
  }

  void toggle() => darkMode = !_isDark;
}

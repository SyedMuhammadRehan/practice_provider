import 'package:flutter/material.dart';

class ThemeModeProvider with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  void setMode(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}

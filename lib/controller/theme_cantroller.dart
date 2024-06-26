import 'package:flutter/material.dart';
import 'package:quotes/header.dart';

class ThemeCantroller extends ChangeNotifier {
  bool isDark = false;
  ThemeMode themeMode = ThemeMode.system;
  SharedPreferences preferences;
  ThemeCantroller({required this.preferences}) {
    changeTheme();
    toggleTheme();
  }

  void changeTheme() {
    themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void toggleTheme() {
    isDark = !isDark;
    preferences.setBool('darkMode', isDark);
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
  }
}

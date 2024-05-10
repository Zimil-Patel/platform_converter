import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = true;

  bool getThemeMode() => _isDark;


  // 1. CHANGE THEME AND UPDATE SHARED PREFERENCE
  Future<void> toggleThemePreference(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('isDark', value);
    _isDark = value;
    notifyListeners();
  }

  // 2. GET THEME PREFERENCE AND CREATE SHARED PREFERENCE IF NOT EXISTS
  Future<void> getThemePreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getKeys().contains('isDark')) {
      _isDark = preferences.getBool('isDark')!;
    } else {
      preferences.setBool('isDark', false);
      _isDark = false;
    }
    notifyListeners();
  }

  ThemeProvider() {
    getThemePreference();
  }
}
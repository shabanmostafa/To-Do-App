import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  static final GetStorage _box = GetStorage();
  static const String _themeKey = 'isDarkMode';

  static bool loadThemeFromBox() {
    return _box.read<bool>(_themeKey) ?? false;
  }

  static void saveThemeToBox(bool isDarkMode) {
    _box.write(_themeKey, isDarkMode);
  }

  static void switchTheme() {
    bool isDarkMode = loadThemeFromBox();
    isDarkMode = !isDarkMode;
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    saveThemeToBox(isDarkMode);
  }
}

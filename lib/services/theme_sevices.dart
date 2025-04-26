import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeSevices {
  final GetStorage _box = GetStorage();
  final String themeKey = 'isDarkMode';

  bool loadThemeFromBox() {
    return _box.read(themeKey) ?? false;
  }

  void saveThemeToBox(bool isDarkMode) {
    _box.write(themeKey, isDarkMode);
  }

  void switchTheme() {
    bool isDarkMode = loadThemeFromBox();
    isDarkMode = !isDarkMode;
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    saveThemeToBox(isDarkMode);
  }
}

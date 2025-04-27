import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/services/theme_sevices.dart';
import 'package:to_do_app/ui/pages/home_page.dart';
import 'package:to_do_app/ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,

      themeMode:
          ThemeServices.loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/services/theme_sevices.dart';
import 'package:to_do_app/ui/size_config.dart';
import 'package:to_do_app/ui/widgets/add_date_picker.dart';
import 'package:to_do_app/ui/widgets/add_task_bar.dart';
import 'package:to_do_app/ui/widgets/custom_app_bar.dart';
import 'package:to_do_app/ui/widgets/no_tasks_yet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: appBar(
        IconButton(
          onPressed: () {
            ThemeServices.switchTheme();

            Get.isDarkMode
                ? Get.snackbar(
                  'Light Mode',
                  'Switched to light mode',
                  backgroundColor: Colors.white,
                  colorText: Colors.black,
                  icon: const Icon(Icons.wb_sunny_outlined),
                )
                : Get.snackbar(
                  'Dark Mode',
                  'Switched to dark mode',
                  backgroundColor: Colors.black,
                  colorText: Colors.white,
                  icon: const Icon(Icons.nightlight_round),
                );
          },
          icon:
              Get.isDarkMode
                  ? Icon(Icons.wb_sunny_outlined, color: Colors.white)
                  : Icon(Icons.nightlight_round, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          AddTaskBar(),
          AddDatePicker(),
          Expanded(child: NoTasksYet()),
        ],
      ),
    );
  }
}

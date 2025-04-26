import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_app/services/theme_sevices.dart';
import 'package:to_do_app/ui/pages/add_task_page.dart';
import 'package:to_do_app/ui/size_config.dart';
import 'package:to_do_app/ui/widgets/button.dart';
import 'package:to_do_app/ui/widgets/custom_app_bar.dart';
import 'package:to_do_app/ui/widgets/input_field.dart';

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
            ThemeSevices().switchTheme();
          },
          icon:
              Get.isDarkMode
                  ? Icon(Icons.wb_sunny_outlined, color: Colors.white)
                  : Icon(Icons.nightlight_round, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          InputField(title: 'Title', hint: 'Enter your title'),
          const SizedBox(height: 20),
          MyButton(
            label: 'Add Task',
            onTap: () {
              Get.to(AddTaskPage());
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/ui/pages/add_task_page.dart';
import 'package:to_do_app/ui/theme.dart';
import 'package:to_do_app/ui/widgets/button.dart';

class AddTaskBar extends StatelessWidget {
  const AddTaskBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd()
                    .format(DateTime.now())
                    .toString()
                    .capitalizeFirst!,
                style: subHeadingStyle,
              ),
              Text('Today', style: headingStyle),
            ],
          ),
          MyButton(
            label: '+ Add Task',
            onTap: () async {
              await Get.to(() => AddTaskPage());
              // _taskController.getTasks();
            },
          ),
        ],
      ),
    );
  }
}

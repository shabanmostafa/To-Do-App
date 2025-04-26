import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/ui/theme.dart';
import 'package:to_do_app/ui/widgets/button.dart';
import 'package:to_do_app/ui/widgets/custom_app_bar.dart';
import 'package:to_do_app/ui/widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final DateTime _selectedDate = DateTime.now();
  final _startTime = DateFormat('hh:mm a').format(DateTime.now());
  final _endTime = DateFormat(
    'hh:mm a',
  ).format(DateTime.now().add(const Duration(minutes: 15)));
  int _selectedRemind = 5;
  final List<int> _remindList = [5, 10, 15, 20];
  final List<String> _repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  late String _selectedRepeat = 'None';
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Add Task', style: headingStyle),
              const SizedBox(height: 20),
              InputField(
                title: 'title',
                hint: 'Enter title here',
                controller: _titleController,
              ),
              InputField(
                title: 'Note',
                hint: 'Enter note here',
                controller: _noteController,
              ),
              InputField(
                title: 'Date',
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: 'Start Time',
                      hint: _startTime,
                      widget: IconButton(
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      title: 'End Time',
                      hint: _endTime,
                      widget: IconButton(
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              InputField(
                title: 'Remind',
                hint: '$_selectedRemind minutes early',
                widget: Row(
                  children: [
                    DropdownButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      items:
                          _remindList.map<DropdownMenuItem<String>>((
                            int value,
                          ) {
                            return DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text(value.toString()),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRemind = int.parse(newValue!);
                        });
                      },
                      underline: Container(height: 0),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              InputField(
                title: 'Repeat',
                hint: _selectedRepeat,
                widget: Row(
                  children: [
                    DropdownButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      items:
                          _repeatList.map<DropdownMenuItem<String>>((
                            String value,
                          ) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRepeat = newValue!;
                        });
                      },
                      underline: Container(height: 0),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Color palette
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Color', style: titleStyle),
                        Wrap(
                          children: List<Widget>.generate(3, (int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColor = index;
                                });
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.primaries[index],
                                      shape: BoxShape.circle,
                                    ),

                                    child:
                                        _selectedColor == index
                                            ? const Icon(
                                              Icons.done,
                                              color: Colors.white,
                                              size: 20,
                                            )
                                            : null,
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                    MyButton(
                      label: 'Creat task',
                      onTap: () {
                        _taskController.addTask(
                          title: _titleController.text,
                          note: _noteController.text,
                          date: DateFormat.yMd().format(_selectedDate),
                          startTime: _startTime,
                          endTime: _endTime,
                          remind: _selectedRemind,
                          repeat: _selectedRepeat,
                          color: _selectedColor,
                        );
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

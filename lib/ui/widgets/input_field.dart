import 'package:flutter/material.dart';
import 'package:to_do_app/ui/theme.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: titleStyle),
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(left: 10),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    readOnly: widget == null ? false : true,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subTitleStyle,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                widget ?? Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

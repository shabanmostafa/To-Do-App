import 'package:flutter/material.dart';
import 'package:to_do_app/ui/theme.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.label, required this.onTap})
    : super(key: key);

  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryClr,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

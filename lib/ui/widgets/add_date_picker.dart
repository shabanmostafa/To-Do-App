import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/ui/theme.dart';

class AddDatePicker extends StatefulWidget {
  const AddDatePicker({super.key});

  @override
  State<AddDatePicker> createState() => _AddDatePickerState();
}

class _AddDatePickerState extends State<AddDatePicker> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 70,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        onDateChange: (newDate) {
          setState(() {
            _selectedDate = newDate;
          });
        },
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

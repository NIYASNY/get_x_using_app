import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:get/get.dart';
import 'package:get_x_project/app/commonwidgets/my_button.dart';
import 'package:get_x_project/app/modules/home/controllers/theme/theme.dart';
import 'package:get_x_project/app/modules/home/views/inputfield.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Task",
                  style: HeadingStyle,
                ),
                MyInputField(title: 'Name', hint: 'Enter your name'),
                MyInputField(title: 'Age', hint: 'Enter age here'),
                MyInputField(title: 'Position', hint: 'Enter your position'),
                MyInputField(
                  title: 'Date',
                  hint: DateFormat.yMd().format(_selectedDate),
                  widget: IconButton(
                      onPressed: () {
                        _getDateFromUser();
                      },
                      icon: Icon(Icons.calendar_today_outlined)),
                ),
                MyInputField(title: 'Place', hint: 'Enter your place'),
                MyInputField(title: 'Address', hint: 'Enter your Address'),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Create Task',
                          style: HeadingStyle,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios),
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? _pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2121));

    if (_pickDate != null) {
      setState(() {
        _selectedDate = _pickDate;
        print(_selectedDate);
      });
    } else {
      print('its null');
    }
  }
}

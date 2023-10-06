import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_project/app/modules/home/controllers/theme/theme.dart';
import 'package:get_x_project/app/modules/home/views/inputfield.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _titlecontroller = TextEditingController();
  final _notecontroller = TextEditingController();
  DateTime _selecteddate = DateTime.now();
  // final HomeController _homeController = Get.put(HomeController());
  // final _formkey = GlobalKey<FormState>();

  // final TextEditingController _notecontroller = TextEditingController();
  // final TextEditingController _titlecontroller = TextEditingController();
  // final TextEditingController _placecontroller = TextEditingController();
  // final TextEditingController _addresscontroller = TextEditingController();
  // final TextEditingController _positioncontroller = TextEditingController();
  // final TextEditingController _placecontroller = TextEditingController();
  // final TextEditingController _addresscontroller = TextEditingController();

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
                MyInputField(
                  title: 'Title',
                  hint: 'Enter your title',
                  controller: _titlecontroller,
                ),
                MyInputField(
                  title: 'Note',
                  hint: 'Enter your note',
                  controller: _notecontroller,
                ),
                MyInputField(
                  title: 'Date',
                  hint: DateFormat.yMd().format(_selecteddate),
                  widget: IconButton(
                      onPressed: () {
                        _getDatefromuser();
                        print('hi there');
                        // _getDateFromUser();
                      },
                      icon: Icon(Icons.calendar_today_outlined)),
                ),
                MyInputField(
                  title: 'Place',
                  hint: 'Enter your place',
                  // controller: _placecontroller,
                ),
                MyInputField(
                  title: 'Address',
                  hint: 'Enter your Address',
                  // controller: _addresscontroller,
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // MyButton(label: 'Create Task', onTap: () => _validadata())
                    TextButton(
                        onPressed: () async {
                          _validadata();
                          // if (_formkey.currentState!.validate()) {
                          //   final Task task = Task();
                          //   _addTaskToDb(task);
                          //   await _taskcontroller.addTask(task);
                          //   Get.back();
                          // }
                        },
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

  _validadata() {
    if (_titlecontroller.text.isNotEmpty && _notecontroller.text.isNotEmpty) {
      //add databa...
      Get.back();
    } else if (_titlecontroller.text.isEmpty || _notecontroller.text.isEmpty) {
      Get.snackbar("Required", "All field are required",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: pinkClr,
          icon: Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ));
    }
  }

  _appBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  _getDatefromuser() async {
    DateTime? _pickerdate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2121),
    );

    if (_pickerdate != null) {
      setState(() {
        _selecteddate = _pickerdate;
        print(_selecteddate);
      });
    } else {
      print('Its null or something as wrong');
    }
  }
}

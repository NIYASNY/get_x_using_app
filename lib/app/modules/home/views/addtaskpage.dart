import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:get/get.dart';
import 'package:get_x_project/app/commonwidgets/my_button.dart';
import 'package:get_x_project/app/model/task.dart';
import 'package:get_x_project/app/modules/home/controllers/home_controller.dart';
import 'package:get_x_project/app/modules/home/controllers/theme/theme.dart';
import 'package:get_x_project/app/modules/home/views/inputfield.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final HomeController _homeController = Get.put(HomeController());
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _notecontroller = TextEditingController();
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _placecontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  // final TextEditingController _positioncontroller = TextEditingController();
  // final TextEditingController _placecontroller = TextEditingController();
  // final TextEditingController _addresscontroller = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Task",
                    style: HeadingStyle,
                  ),
                  MyInputField(
                    title: 'Name',
                    hint: 'Enter your name',
                    controller: _notecontroller,
                  ),
                  MyInputField(
                    title: 'Age',
                    hint: 'Enter age here',
                    controller: _titlecontroller,
                  ),
                  MyInputField(
                    title: 'Position',
                    hint: 'Enter your position',
                    // controller: _positioncontroller,
                  ),
                  MyInputField(
                    title: 'Date',
                    hint: DateFormat.yMd().format(_selectedDate),
                    widget: IconButton(
                        onPressed: () {
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
                      TextButton(
                          onPressed: () async {
                            _validatedata();
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
      ),
    );
  }

  // _addTaskToDb(Task task) {
  //   task.title = 0;
  //   task.name = _namecontroller.text;
  //   task.age = _agecontroller.toString();
  //   task.position = _positioncontroller.text;
  //   task.place = _placecontroller.text;
  //   task.address = _addresscontroller.text;
  // }

  _addTasktoDb() async {
    int value = await _homeController.addTask();
    task:
    Task(
      note: _notecontroller.text,
      title: _titlecontroller.text,
      date: DateFormat.yMd().format(_selectedDate),
      place: _placecontroller.text,
      address: _addresscontroller.text,
    );
    print('My id is $value');
  }

  _validatedata() {
    if (_notecontroller.text.isNotEmpty && _titlecontroller.text.isNotEmpty) {
      _addTasktoDb();
      Get.back();
    } else if (_notecontroller.text.isEmpty || _titlecontroller.text.isEmpty) {
      Get.snackbar('Required', 'All field all required',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          icon: Icon(Icons.warning_amber_rounded));
    }
  }
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

  // _getDateFromUser() async {
  //   DateTime? _pickDate = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2015),
  //       lastDate: DateTime(2121));

    // if (_pickDate != null) {
    //   setState(() {
    //     _selectedDate = _pickDate;
    //     print(_selectedDate);
    //   });
    // } else {
    //   print('its null');
    // }
  //}

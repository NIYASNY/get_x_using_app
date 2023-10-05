import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_project/app/modules/home/controllers/home_controller.dart';
import 'package:get_x_project/app/modules/home/controllers/theme/theme.dart';
import 'package:get_x_project/app/modules/home/views/addtaskpage.dart';
import 'package:get_x_project/app/modules/home/views/myhome.dart';
import 'package:get_x_project/app/modules/home/views/signin.dart';
import 'package:intl/intl.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final HomeController _taskController = Get.put(HomeController());
  var currentPage = DrawerSection.dashboard;

  // @override
  // void initState() {
  //   _taskController.getTask();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        // backgroundColor: context.theme.backgroundColor,
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {},
            ),
            MyDrawerList()
          ],
        ),
        // child: ListView(
        //   children: <Widget>[
        //     GestureDetector(
        //       onTap: () {},
        //     ),
        //     MyDrawerList(),
        //   ],
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(AddTaskPage()),
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          _appTaskbar(),
        ],
      ),
    );
  }

  _appTaskbar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          // menuItem()
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSection.dashboard ? true : false),
          menuItem(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSection.contacts ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSection.events ? true : false),
          menuItem(4, "Settings", Icons.settings_outlined,
              currentPage == DrawerSection.settings ? true : false),
          menuItem(5, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSection.notifications ? true : false),
          menuItem(6, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSection.privacy_policy ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          // Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSection.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSection.contacts;
            } else if (id == 3) {
              currentPage = DrawerSection.events;
            } else if (id == 4) {
              currentPage = DrawerSection.settings;
            } else if (id == 5) {
              currentPage = DrawerSection.notifications;
            } else if (id == 6) {
              currentPage == DrawerSection.privacy_policy;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSection {
  dashboard,
  contacts,
  events,
  settings,
  notifications,
  privacy_policy
}

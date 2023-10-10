import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_project/app/model/database.dart';
import 'package:get_x_project/app/modules/home/views/mywidget.dart';
import 'package:get_x_project/app/modules/home/views/signin.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await DbHelper.initDb();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX_App',
      routes: {
        '/': (context) => Signin(),
        'widget': (context) => MyWidget(),
      },
    );
  }
}

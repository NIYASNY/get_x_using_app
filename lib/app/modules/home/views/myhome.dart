import 'package:flutter/material.dart';
import 'package:get_x_project/app/commonwidgets/my_secbutton.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('asfdsad')
                ],
              ),
            ),
            MyHomeButton(label: "+ Add Task", onTap: () => null)
          ],
        )
      ],
    );
  }
}
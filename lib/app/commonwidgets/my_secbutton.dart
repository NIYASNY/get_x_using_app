import 'package:flutter/material.dart';
import 'package:get_x_project/app/modules/home/controllers/theme/theme.dart';

class MyHomeButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyHomeButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(10),
          color: primaryClr,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,

          ),
        ),
      ),
    );
  }
}

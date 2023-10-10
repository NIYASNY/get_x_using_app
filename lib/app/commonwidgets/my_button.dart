// import 'package:flutter/material.dart';

// class MyButton extends StatelessWidget {
//   final Function()? onTap;

//   const MyButton({super.key, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(25),
//       margin: EdgeInsets.symmetric(horizontal: 25),
//       decoration: BoxDecoration(
//           color: Colors.black, borderRadius: BorderRadius.circular(8)),
//       child: const Center(
//         child: Text(
//           'Sign in',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get_x_project/app/modules/home/controllers/theme/theme.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: primaryClr),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

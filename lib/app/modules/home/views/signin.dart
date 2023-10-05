import 'package:flutter/material.dart';
import 'package:get_x_project/app/commonwidgets/image.dart';
import 'package:get_x_project/app/commonwidgets/my_button.dart';
import 'package:get_x_project/app/modules/home/views/textfield.dart';
import 'package:lottie/lottie.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final usercontroller = TextEditingController();
  final passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Lottie.network(
                    'https://lottie.host/d869db68-6c5e-46f6-acd7-197b7f2da684/zAzdU7PHxR.json',
                    fit: BoxFit.cover,
                    width: 200),
                SizedBox(height: 50),
                Text(
                  'Welcome back you',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                MyTextField(
                  controller: usercontroller,
                  hintText: 'Username',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passcontroller,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                // MyButton(
                //   onTap: () {},
                // ),
                // MyButton(label: , onTap: () {}),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Text('or continue with'),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImagePage(
                        onTap: () {
                          Navigator.pushNamed(context, 'widget');
                        },
                        imagePath:
                            'https://w7.pngwing.com/pngs/326/85/png-transparent-google-logo-google-text-trademark-logo.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    ImagePage(
                        onTap: () {},
                        imagePath:
                            'https://image.similarpng.com/very-thumbnail/2020/04/Popular-facebook-Logo-png.png'),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Register Now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

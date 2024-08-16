import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_ecamples_login_page/homepage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: emailControler,
                    decoration: const InputDecoration(
                        hintText: 'Enter Email',
                        contentPadding: EdgeInsets.all(1),
                        hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w900)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passwordControler,
                    decoration: const InputDecoration(
                        hintText: 'Enter Password',
                        contentPadding: EdgeInsets.all(1),
                        hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w900)),
                  ),
                ),

                // setting the data and checking and moving to next page
                MaterialButton(
                  onPressed: () async {
                    // creating a variable
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    // storing the data in shared preferences
                    sharedPreferences.setString('email', emailControler.text);
                    // creating a naviagater be get navigation management
                    Get.to(const Homepage());
                  },
                  child: const Text('Login '),
                )
              ],
            ),
          ),
        ));
  }
}

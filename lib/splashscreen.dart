import "dart:async";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:shared_preferences_ecamples_login_page/Homepage.dart";
import "package:shared_preferences_ecamples_login_page/Loginpage.dart";

// step 3 creating a variabel to check
String? finalEmail;

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  // step 1 creating timer and navigating to back home Screen
  @override
  void initState() {
    // Timer(Duration(seconds: 2), () => Get.to(Loginpage())); later t check wether data is tere or not
    getValidationData().whenComplete(() async {
      // instance of moving to login page we check the value first
      Timer(Duration(seconds: 2), () {
        print('Timer triggered');

        Get.to(finalEmail == null ? const Loginpage() : const Homepage());
        print('Get.to called');
      });
    });
    super.initState();
  }

// step 2 checking for the sharepreference data in future method by  getString

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedField = sharedPreferences.getString('email');
    // step 4 the data of sharepreference set in a variabel and setting into setstate to check weather to move to login or home by initstate
    setState(() {
      finalEmail = obtainedField;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // step 1 creating a page
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              child: Icon(Icons.local_activity),
            ),
          ]),
    ));
  }
}

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:shared_preferences/shared_preferences.dart";

import "package:shared_preferences_ecamples_login_page/loginpage.dart";
import "package:shared_preferences_ecamples_login_page/splashscreen.dart";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Text('Hello $finalEmail'),
            ),
            MaterialButton(
              color: Colors.amberAccent,
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();

                sharedPreferences.remove('email');
                Get.to(Loginpage());
              },
              child: const Text('Remove all credentials '),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences_ecamples_login_page/Splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Splashscreen(),
    );
  }
}

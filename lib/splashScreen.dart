import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_form/commone/appColor.dart';
import 'package:google_form/screens/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void islogin() {
    Timer(const Duration(seconds: 3), () {
      Get.to(HomeScreen());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    islogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Welcome! ",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: kPrimaryColor),
        ),
      ),
    );
  }
}

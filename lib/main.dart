import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_form/commone/appColor.dart';
import 'package:google_form/commone/appText.dart';
import 'package:google_form/firebase_options.dart';
import 'package:google_form/screens/homescreen.dart';
import 'package:google_form/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.firebaseUpdate,
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}

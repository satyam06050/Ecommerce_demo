import 'package:ecommerce_demo/firebase_options.dart';

import 'package:ecommerce_demo/screens/auth_ui/WelcomeScreen.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // print("Firebase Initializes !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: 'Flutter Demo', home: WelcomeScreen());
  }
}

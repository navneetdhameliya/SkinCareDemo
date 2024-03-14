import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skincaredemo/UI/screens/MainSection/main_screen.dart';
import 'package:skincaredemo/infrastructure/commons/constants/app_pages.dart';

SharedPreferences? sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseOptions firebaseOptions = FirebaseOptions(
      apiKey: 'AIzaSyARli_aQY4WqODjlZsYAexmiHopQdHVQhU',
      appId: Platform.isIOS
          ? '1:283098237939:ios:06c8fc95a10916d632e086'
          : '1:283098237939:android:df6cd8e6e1b47aea32e086',
      messagingSenderId: '',
      projectId: 'skincaredemo-2f11e');

  await Firebase.initializeApp(
    name: "SkinCareDemo",
    options: firebaseOptions,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      getPages: AppPages.routes,
      home: const MainScreen(),
      initialRoute: AppPages.initial,
    );
  }
}


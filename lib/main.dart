import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skincaredemo/UI/screens/MainSection/main_screen.dart';
import 'package:skincaredemo/infrastructure/commons/constants/app_pages.dart';

SharedPreferences? sharedPreferences;
void main() {
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

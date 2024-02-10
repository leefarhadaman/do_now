import 'package:do_now/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:do_now/firebase_options.dart';
import 'package:get/get.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Set the default light theme
      darkTheme: ThemeData.dark(), // Set the default dark theme
      themeMode: ThemeMode.system, // Set the default theme mode to follow system settings
      home: SplashView(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nubank_clone/pages/home/home_page.dart';
import 'package:nubank_clone/pages/splash/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xFF4A148C),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nubank Design Clone',
      theme:
          ThemeData(primarySwatch: Colors.purple, brightness: Brightness.dark),
      home: const SplashScreen(),
    );
  }
}

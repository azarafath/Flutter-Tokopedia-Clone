import 'package:flutter/material.dart';
import 'package:tokped/ui/pages/home_page.dart';
import 'package:tokped/ui/pages/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => const SplashScreen(),
      '/home': (context) => const HomePage(),
    });
  }
}

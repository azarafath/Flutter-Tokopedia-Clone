import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokped/providers/carousel_provider.dart';
import 'package:tokped/providers/product_provider.dart';
import 'package:tokped/ui/pages/home_page.dart';
import 'package:tokped/ui/pages/splash_screen_page.dart';
import 'providers/balance_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BalanceProvider()),
        ChangeNotifierProvider(create: (context) => CarouselProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}

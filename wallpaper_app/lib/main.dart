import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: false,
      ),
      initialRoute: 'home',
      routes: {'home': (context) => const Homepage()},
    );
  }
}

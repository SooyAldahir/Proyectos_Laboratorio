import 'package:book_store_online/pages/settings/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:book_store_online/pages/explore/explore_page.dart';
import 'package:book_store_online/pages/settings/settings_page.dart';
import 'package:book_store_online/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: false,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
        'explore': (context) => const ExplorePage(),
        'settings': (context) => const SettingsPage(),
        'favorites': (context) => const FavoritesPage()
      },
    );
  }
}

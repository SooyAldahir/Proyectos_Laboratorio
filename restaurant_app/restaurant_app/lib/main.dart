import 'package:flutter/material.dart';
import 'package:restaurant_app/src/pages/home/home_page.dart';
import 'package:restaurant_app/src/pages/details/details_page.dart';
import 'package:restaurant_app/src/pages/checkout/checkout_page.dart';
import 'package:restaurant_app/src/pages/perfil/perfil_page.dart';

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
        'details': (context) => const DetailsPage(),
        'checkout': (context) => const CheckoutPage(),
        'perfil': (context) => const PerfilPage()
      },
    );
  }
}

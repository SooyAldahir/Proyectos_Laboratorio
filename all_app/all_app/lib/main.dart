import 'package:flutter/material.dart';

import 'package:all_app/src/pages/home/home_page.dart';
import 'package:all_app/src/pages/calendar/calendar_page.dart';
import 'package:all_app/src/pages/tasks/task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: false,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
        'calendar': (context) => const CalendarPage(),
        'task': (context) => const TaskPage()
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskController {
  BuildContext? context;

  Future? init(BuildContext context) {
    this.context = context;
  }

  void goToCalendarPage() {
    Navigator.pushNamed(context!, 'calendar');
  }
}

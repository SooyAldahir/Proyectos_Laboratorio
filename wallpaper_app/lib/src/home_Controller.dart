import 'package:flutter/material.dart';

class HomeController {
  BuildContext? context;
  TextEditingController homeController = TextEditingController();

  void init(BuildContext context) {
    this.context = context;
  }
}
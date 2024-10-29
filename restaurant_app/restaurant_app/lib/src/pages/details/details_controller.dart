import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetailsController {
  BuildContext? context;

  Future? init(BuildContext context) {
    this.context = context;
  }

  void goToHomePage() {
    Navigator.pushNamed(context!, 'home');
  }
}

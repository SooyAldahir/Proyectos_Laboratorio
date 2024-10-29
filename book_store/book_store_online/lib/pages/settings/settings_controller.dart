import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsController {
  BuildContext? context;

  Future? init(BuildContext context) {
    this.context = context;
  }

  void goTofavoritePage() {
    Navigator.pushNamed(context!, 'favorites');
  }
}

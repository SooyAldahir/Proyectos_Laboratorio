import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritesController {
  BuildContext? context;

  Future? init(BuildContext context) {
    this.context = context;
  }

  void goToSettingsePage() {
    Navigator.pop(context!);
  }
}

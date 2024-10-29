import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeeallController {
  BuildContext? context;

  Future? init(BuildContext context) {
    this.context = context;
  }

  void goToExplorePage() {
    Navigator.pop(context!);
  }
}

import 'package:flutter/material.dart';

class AppController {
  ValueNotifier<bool> lightTheme = ValueNotifier(false);
  void changeTheme() {
    lightTheme.value = !lightTheme.value;
  }
}

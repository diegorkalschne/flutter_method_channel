import 'package:flutter/material.dart';

import '../main.dart';

void showSnackbar(
  String message, {
  int seconds = 3,
}) {
  scaffoldKey.currentState!.removeCurrentSnackBar();

  scaffoldKey.currentState!.showSnackBar(
    SnackBar(
      content: Text('$message'),
      duration: Duration(seconds: seconds),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

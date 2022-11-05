import 'package:flutter/material.dart';

import 'views/home_screen_view.dart';

void main() => runApp(const FlutterMethodChannel());

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class FlutterMethodChannel extends StatelessWidget {
  const FlutterMethodChannel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Method Channel',
      theme: ThemeData.dark(),
      scaffoldMessengerKey: scaffoldKey,
      home: const HomeScreenView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'appScreen/home_screen.dart';

Future<void> main() async {

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meditation App',
      debugShowCheckedModeBanner:false,
      home:HomeScreen(),
    );
  }
}


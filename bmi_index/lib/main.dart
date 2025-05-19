import 'package:flutter/material.dart';

import 'pages/homescreen.dart';
import 'pages/introPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Intropage(),
      routes: {
        '/intropage': (context) => const Intropage(),
        '/homescreen': (context) => const Homescreen(),
      },
    );
  }
}

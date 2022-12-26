import 'package:flutter/material.dart';
import 'Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News 24",
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.grey,
        fontFamily: 'SpaceGrotesk'
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}


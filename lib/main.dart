import 'package:flutter/material.dart';
import 'package:devfest_accra_2026/welcome.dart';

void main() {
  runApp(const DevFestApp());
}

class DevFestApp extends StatelessWidget {
  const DevFestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFest Accra 2026',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4285F4)),
      ),
      home: const WelcomeScreen(),
    );
  }
}

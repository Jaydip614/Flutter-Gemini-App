import 'package:flutter/material.dart';
import 'package:gemini_app/views/screens/home_screen.dart';

class GeminiApp extends StatelessWidget {
  const GeminiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gemini",
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

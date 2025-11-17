import 'package:flutter/material.dart';
import 'package:gemini_app/views/screens/chat_section.dart';
import 'package:gemini_app/views/widgets/appbar.dart';
import 'package:gemini_app/views/widgets/bottom_navbar.dart';
import 'package:gemini_app/views/widgets/custom_drawer.dart';
import 'package:gemini_app/views/widgets/greeting_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _messages = [
    "Hii",
    "Hey Jedy! How are you doing today?",
    "What is Flutter?",
    "Flutter is cross-platform application development technology.",
  ];

  void _addMessage(String message) {
    setState(() {
      _messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppbar(title: "Gemini",),
      drawer: CustomDrawer(),
      body: _messages.isNotEmpty ? ChatSection(messages: _messages) : GreetingWidget(),
      bottomNavigationBar: CustomBottomNavbar(),
    );
  }
}

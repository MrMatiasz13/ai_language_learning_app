import 'package:ai_language_learning_app/config/themes/themes.dart';
import 'package:ai_language_learning_app/features/chat/presentation/pages/chat_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Language App',
      theme: lightMode,
      darkTheme: darkMode,
      home: const ChatPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:memory_game/data/brain.dart';
import 'package:memory_game/screens/game_screen.dart';
import 'package:memory_game/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memory Game',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0a0e21),
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
      home: GameScreen(Level.Easy),
    );
  }
}

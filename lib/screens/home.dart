import 'package:flutter/material.dart';
import 'package:memory_game/data/brain.dart';
import 'package:memory_game/screens/game_screen.dart';
import 'package:memory_game/widgets/my_containers.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Memory Game',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(Level.Easy),
                  ),
                );
              },
              child: MyContainers(
                colours: Colors.indigo,
                title: 'Easy',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(Level.Medium),
                  ),
                );
              },
              child: MyContainers(
                colours: Colors.amber[900],
                title: 'Medium',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(Level.Hard),
                  ),
                );
              },
              child: MyContainers(
                colours: Colors.red[900],
                title: 'Hard',
              ),
            ),
          ],
        ));
  }
}

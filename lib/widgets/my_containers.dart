import 'package:flutter/material.dart';

class MyContainers extends StatelessWidget {
  final Color colours;
  final String title;

  const MyContainers({Key key, @required this.colours, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colours,
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

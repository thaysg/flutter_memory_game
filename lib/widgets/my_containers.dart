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
        height: MediaQuery.of(context).size.height * .15,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colours,
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 40,
                letterSpacing: 1.5,
                wordSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontFamily: 'Regular',
                color: Colors.black,
                shadows: [
                  Shadow(
                      blurRadius: 5.0,
                      color: Colors.amber[100],
                      offset: Offset(0, 4.0)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

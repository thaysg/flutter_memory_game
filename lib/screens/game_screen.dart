import 'dart:async';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/data/brain.dart';
import 'package:memory_game/screens/home.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class GameScreen extends StatefulWidget {
  final Level _level;

  GameScreen(this._level);
  @override
  _GameScreenState createState() => _GameScreenState(_level);
}

class _GameScreenState extends State<GameScreen> {
  _GameScreenState(this._level);

  var height = 50;
  var width = 30;

  Level _level;
  int _previousIndex = -1;
  bool _flip = false;
  bool _start = false;
  bool _wait = false;
  Timer _timer;
  int _time = 5;
  int _left;
  bool _isFinished;
  List<String> _data;
  List<bool> _cards;
  List<GlobalKey<FlipCardState>> _cardState;

  //Criar cards
  Widget getItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(5),
      child: Image.asset(
        _data[index],
        fit: BoxFit.cover,
      ),
    );
  }

  _startTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        _time = _time - 1;
      });
    });
  }

  //Restart game
  void restart() {
    _startTime();
    _data = getLevel(_level);
    _cards = getInitialItem(_level);
    _cardState = getCards(_level);
    _time = 5;
    _left = (_data.length ~/ 2);
    _isFinished = false;
    _onAlertButtonsPressed(context);
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        _start = true;
        _timer.cancel();
      });
    });
  }

  //AlertButton
  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      image: Image.asset('images/iron_man.jpeg'),
      title: "Parabéns",
      buttons: [
        DialogButton(
          child: Text(
            "Jogar Novamente",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          gradient: LinearGradient(colors: [
            Color.fromRGBO(255, 0, 0, 1.0),
            Color.fromRGBO(255, 0, 0, 1.0)
          ]),
        )
      ],
    ).show();
  }

  @override
  void initState() {
    super.initState();

    restart();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isFinished
        ? Scaffold(
            body: Center(
              child: Container(
                child: Column(
                  children: [
                    Image.asset('images/iron_man.jpeg'),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          restart();
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.indigo[900],
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Jogar Novamente",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                        16,
                      ),
                      child: _time > 0
                          ? Text(
                              '$_time',
                            )
                          : Text(
                              '$_left',
                            ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        16,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 32,
                        ),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  //childAspectRatio: width / height,
                                  crossAxisCount: 4,
                                  crossAxisSpacing:
                                      5.0, //O espaçamento lateral entre as grids
                                  mainAxisSpacing:
                                      5.0 //Espaçamento Top Bottom entre as grids
                                  ),
                          itemBuilder: (context, index) => _start
                              ? FlipCard(
                                  key: _cardState[index],
                                  onFlip: () {
                                    if (!_flip) {
                                      _flip = true;
                                      _previousIndex = index;
                                    } else {
                                      _flip = false;
                                      if (_previousIndex != index) {
                                        if (_data[_previousIndex] !=
                                            _data[index]) {
                                          _wait = true;

                                          Future.delayed(
                                              const Duration(milliseconds: 900),
                                              () {
                                            _cardState[_previousIndex]
                                                .currentState
                                                .toggleCard();
                                            _previousIndex = index;
                                            _cardState[_previousIndex]
                                                .currentState
                                                .toggleCard();

                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 160), () {
                                              setState(() {
                                                _wait = false;
                                              });
                                            });
                                          });
                                        } else {
                                          _cards[_previousIndex] = false;
                                          _cards[index] = false;
                                          print(_cards);

                                          setState(() {
                                            _left -= 1;
                                          });
                                          if (_cards.every((t) => t == false)) {
                                            print("Won");
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 160), () {
                                              setState(() {
                                                _isFinished = true;
                                                _start = false;
                                              });
                                            });
                                          }
                                        }
                                      }
                                    }
                                    setState(() {});
                                  },
                                  flipOnTouch: _wait ? false : _cards[index],
                                  direction: FlipDirection.HORIZONTAL,
                                  front: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    margin: EdgeInsets.all(4.0),
                                    child: Image.asset(
                                      "images/logo2.jpeg",
                                    ),
                                  ),
                                  back: getItem(index))
                              : getItem(index),
                          itemCount: _data.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

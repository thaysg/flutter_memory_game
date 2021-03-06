import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

enum Level { Easy, Medium, Hard }

List<String> imageArray() {
  return [
    'images/avengers.jpeg',
    'images/avengers.jpeg',

    'images/black_panther.jpeg',
    'images/black_panther.jpeg',

    'images/black_widow.jpeg',
    'images/black_widow.jpeg',

    'images/captain.jpeg',
    'images/captain.jpeg',

    'images/gamora.jpeg',
    'images/gamora.jpeg',

    'images/groot.jpeg',
    'images/groot.jpeg',

    'images/iron_man.jpeg',
    'images/iron_man.jpeg',

    'images/rocket.jpeg',
    'images/rocket.jpeg',

    'images/war_machine.jpeg',
    'images/war_machine.jpeg',

    'images/wanda.jpeg',
    'images/wanda.jpeg',

    //'images/ironman-removebg-preview.png',
/*
    'images/logo.jpeg',
    'images/logo.jpeg',

    'images/logo2.jpeg',
    'images/logo2.jpeg',

    'images/mantis.jpeg',
    'images/mantis.jpeg',
    
    'images/rocket.jpeg',
    'images/spider.jpeg',
    'images/star_lord.jpeg',
    'images/strange.jpeg',
    'images/thanos.jpeg',
    'images/thor.jpeg',
    'images/vision.jpeg',
    'images/wanda.jpeg',
    'images/war_machine.jpeg'
    */
  ];
}

List getLevel(Level level) {
  List<String> levelType = List<String>();
  List levelArray = imageArray();
  if (level == Level.Hard) {
    levelArray.forEach((element) {
      levelType.add(element);
    });
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      levelType.add(levelArray[i]);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 8; i++) {
      levelType.add(levelArray[i]);
    }
  }
  levelType.shuffle();
  return levelType;
}

List<bool> getInitialItem(Level level) {
  List<bool> item = List<bool>();
  if (level == Level.Hard) {
    for (int i = 0; i < 20; i++) {
      item.add(true);
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      item.add(true);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 8; i++) {
      item.add(true);
    }
  }
  return item;
}

List<GlobalKey<FlipCardState>> getCards(Level level) {
  List<GlobalKey<FlipCardState>> cardStateKeys =
      List<GlobalKey<FlipCardState>>();
  if (level == Level.Hard) {
    for (int i = 0; i < 20; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 8; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }
  return cardStateKeys;
}

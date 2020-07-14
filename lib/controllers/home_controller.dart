import 'dart:async';

import 'package:borrowed_stuff/components/stuff_card.dart';
import 'package:borrowed_stuff/database/stuff_dao.dart';
import 'package:borrowed_stuff/models/stuff.dart';
import 'package:flutter/material.dart';

class HomeController {
  final _stuffDao = StuffDao();
  final stuffList = [];
  final GlobalKey<AnimatedListState> animatedListKey = GlobalKey();

  void create(Stuff stuff) {
    _stuffDao.create(stuff);
    stuffList.add(stuff);
    if (animatedListKey.currentState != null) {
      Timer(Duration(milliseconds: 500), () {
        animatedListKey.currentState.insertItem(stuffList.length - 1);
      });
    }
  }

  Future<void> readAll() async {
    final list = await _stuffDao.readAll();
    stuffList.addAll(list);
  }

  void update(int index, Stuff stuff) {
    _stuffDao.update(stuff);
    stuffList[index] = stuff;
  }

  void delete(Stuff stuff) {
    _stuffDao.delete(stuff);
    var index = stuffList.indexOf(stuff);
    stuffList.remove(stuff);
    animatedListKey.currentState.removeItem(
      index,
      (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: StuffCard(
          stuff: stuff,
          onDelete: () {},
          onEdit: () {},
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GameButton {
  int id;
  Color bg;
  String text;
  bool enabled;

  GameButton({this.id, this.bg=Colors.blueGrey, this.text="", this.enabled=false});
}
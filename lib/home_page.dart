import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tic Tac Toe"),
      ),
      body: new Container(),
    );
  }
}

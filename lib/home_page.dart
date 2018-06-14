import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/button.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<HomePage> {
  List<GameButton> buttonsList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonsList = initList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tic Tac Toe"),
        centerTitle: true,
      ),
      body: new Center(
        child: new GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0),
            itemCount: buttonsList.length,
            itemBuilder: (context, i) => new SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child: new RaisedButton(
                    onPressed: null,
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      buttonsList[i].text,
                      style: new TextStyle(color: Colors.white, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    color: buttonsList[i].bg,
                    disabledColor: buttonsList[i].bg,
                  ),
                )),
      ),
    );
  }

  List<GameButton> initList() {
    List<GameButton> list = new List();
    list.add(new GameButton(id: 1));
    list.add(new GameButton(id: 2));
    list.add(new GameButton(id: 3));
    list.add(new GameButton(id: 4));
    list.add(new GameButton(id: 5));
    list.add(new GameButton(id: 6));
    list.add(new GameButton(id: 7));
    list.add(new GameButton(id: 8));
    list.add(new GameButton(id: 9));
    return list;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_toe/button.dart';
import 'winner_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<HomePage> {
  List<GameButton> buttonsList;
  var player1, player2, activePlayer;
  static const sizeOfGame = 3;
  int count;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonsList = initList();
  }

  List<GameButton> initList() {
    count = 0;
    activePlayer = 1;
    player1 = new List();
    player2 = new List();
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

  void playGame(GameButton gb) {
    count++;
    setState(() {
      if (activePlayer == 1) {
        gb.bg = Colors.redAccent;
        gb.text = "O";
        player1.add(gb.id);
        activePlayer = 2;
      } else {
        gb.bg = Colors.black;
        gb.text = "X";
        player2.add(gb.id);
        activePlayer = 1;
      }
    });
    gb.enabled = false;
    checkWinner();
  }

  void checkWinner() {
    int winner = -1;
    for (int i = 1; i <= sizeOfGame * sizeOfGame; i++) {
      if ((player1.contains(i) &&
              player1.contains(i + 1) &&
              player1.contains(i + 2)) ||
          (player1.contains(i) &&
              player1.contains(i + sizeOfGame) &&
              player1.contains(i + 2 * sizeOfGame)) ||
          (player1.contains(1) && player1.contains(5) && player1.contains(9)) ||
          (player1.contains(3) && player1.contains(5) && player1.contains(7)))
        winner = 1;

      else if ((player2.contains(i) &&
          player2.contains(i + 1) &&
          player2.contains(i + 2)) ||
          (player2.contains(i) &&
              player2.contains(i + sizeOfGame) &&
              player2.contains(i + 2 * sizeOfGame)) ||
          (player2.contains(1) && player2.contains(5) && player2.contains(9)) ||
          (player2.contains(3) && player2.contains(5) && player2.contains(7)))
        winner = 2;
    }

    // TODO dialog not getting displayed
    if (winner == 1) {
      showDialog(
          context: context,
          builder: (_) => new CustomDialog(
              "Player 1 Wins", "Want to reset the game?", resetGame));
    } else if (winner == 2) {
      showDialog(
          context: context,
          builder: (_) => new CustomDialog(
              "Player 2 Wins", "Want to reset the game?", resetGame));
    } else if (count == sizeOfGame * sizeOfGame && winner == -1) {
      showDialog(
          context: context,
          builder: (_) => new CustomDialog(
              "That's a draw!", "Want to reset the game?", resetGame));
    }
  }

  VoidCallback resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList = initList();
    });
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
                    onPressed: (buttonsList[i].enabled)
                        ? () => playGame(buttonsList[i])
                        : null,
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
}

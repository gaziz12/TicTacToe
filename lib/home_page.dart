import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tictactoe/game_button.dart';

class HomePage extends StatefulWidget {
  @override 
  _HomePageState createState() => new _HomePageState();
}
  class _HomePageState extends State<HomePage>{
    List<GameButton> buttonsList;
    var player1;
    var player2;
    var activePlayer;
    final Map<String,List<int>> possibleCombinations = HashMap<String, List<int>>();

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonsList = doInit();
      }
        @override
        Widget build(BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("Tic Tac Toe"),
            ),
            body: new GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0
              ),
              itemCount: buttonsList.length,
              itemBuilder: (context,i)=> new SizedBox(
                width: 100.0,
                height: 100.0,
                child: new RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  onPressed: buttonsList[i].enabled
                      ? () => playGame(buttonsList[i])
                      : null,
                  child: new Text(
                    buttonsList[i].text,
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0),
                  ),
                  color: buttonsList[i].bg,
                  disabledColor: buttonsList[i].bg,
                ),
              ),
            ));
      }
    
      List<GameButton> doInit() {
        player1 = new List();
        player2 = new List();
        activePlayer = 1;
        getAllPossibleCombinations();

        var gameButtons = <GameButton>[
          new GameButton(id: 1),
          new GameButton(id: 2),
          new GameButton(id: 3),
          new GameButton(id: 4),
          new GameButton(id: 5),
          new GameButton(id: 6),
          new GameButton(id: 7),
          new GameButton(id: 8),
          new GameButton(id: 9),
        ];
        return gameButtons;
      }

  void playGame(GameButton gameButtonsList) {
    setState(() {
      if(activePlayer ==1){
        gameButtonsList.text = "X";
        gameButtonsList.bg = Colors.red;
        activePlayer = 2;
        player1.add(gameButtonsList.id);
      }
      else{
        gameButtonsList.text = "O";
        gameButtonsList.bg = Colors.black;
        activePlayer = 1;
        player2.add(gameButtonsList.id);
      }
      gameButtonsList.enabled = false;
      checkWinner();
          });
        }
      
  void checkWinner() {
    var winner = -1;
    for(var i in possibleCombinations.entries){
      i.key
    }
    if(player1.contains(1) && player1.contains(2) && player1.contains(3)){
      winner = 1;
    }
  }

  void getAllPossibleCombinations(){ 
    possibleCombinations["horizontalRow1"] = [1,2,3];
    possibleCombinations["horizontalRow2"] = [4,5,6] ;
    possibleCombinations["horizontalRow3"] = [7,8,9];
    possibleCombinations["verticalRow1"] = [1,4,7];
    possibleCombinations["verticalRow2"] = [2,5,8];
    possibleCombinations["verticalRow3"] = [3,6,9];
    possibleCombinations["diagonalTopRightToBottomLeft"] = [1,5,9];
    possibleCombinations["diagonalTopLeftToBottomRight"] = [3,5,7];
  }
}
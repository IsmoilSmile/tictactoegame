import 'package:flutter/material.dart';
import '../game_ui/theme/game_color.dart';
import '../utils/games.dart';

class GameScreen extends StatefulWidget {
  static final String id = "games_page";
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String Value = "X";
  bool gamesover = false;
  int turn = 0;
  String result = "";
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];

  Games games = Games();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    games.board = Games.initGameBoard();
    print(games.board);
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: GameColor.priColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Tic Tac Toe", style: TextStyle(fontFamily: "Billabong",fontSize: 35,color: Colors.black45),),
          Text("you press ${Value}",
            style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 25,fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: boardWidth,
            height: boardWidth,
            child: GridView.count(
              crossAxisCount: Games.boardlenght ~/ 3,
              padding: EdgeInsets.all(16),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(Games.boardlenght, (index) {
                return InkWell(
                  onTap: gamesover
                      ? null
                      : () {
                    if (games.board![index] == "") {
                      setState(() {
                        games.board![index] = Value;
                        turn++;
                        gamesover =
                            games.winnerCh(Value, index, scoreboard, 3);
                        if (gamesover) {
                          result = "$Value winer";
                        }else if(!gamesover && turn == 9){
                          result = "Draw!";
                          gamesover = true;
                        }
                        if (Value == "X")
                          Value = "O";
                        else
                          Value = "X";
                      });
                    }
                    ;
                  },
                  child: Container(
                    width: Games.blocSize,
                    height: Games.blocSize,
                    decoration: BoxDecoration(
                      color: GameColor.secColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        games.board![index],
                        style: TextStyle(
                          color: games.board![index] == "X"
                              ? Colors.black
                              : Colors.white,
                          fontSize: 50.0,fontFamily: "Billabong"
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            result,
            style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 25,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10,),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                games.board = Games.initGameBoard();
                Value = "X";
                gamesover = false;
                turn = 0;
                result = "";
                scoreboard = [0,0,0,0,0,0,0,0];
              });
            },
            icon: Icon(Icons.replay),
            label: Text("Again game"),
          ),
        ],
      ),
    );
  }
}

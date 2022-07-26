import 'package:flutter/material.dart';
import 'package:tictactoegame/pages/games_home.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigothome();
  }
  void _navigothome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, GameScreen.id);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
          ),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/img_1.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 25,),
          Text("Welcome",style: TextStyle(fontFamily: "Billabong", fontSize: 35,color: Colors.orange),),
          Text(
            "Tic Tac Toe ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35,fontFamily: "Billabong",color: Colors.orange),
          ),
          SizedBox(height: 150),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "From ",
                    style: TextStyle(fontFamily: "Billabong", fontSize: 20),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Smile ",
                    style: TextStyle(
                        fontFamily: "Billabong",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

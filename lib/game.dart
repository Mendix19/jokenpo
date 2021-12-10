// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:math';

class game extends StatefulWidget {
  const game({Key? key}) : super(key: key);

  @override
  _gameState createState() => _gameState();
}

class _gameState extends State<game> {
  var imageApp = AssetImage("images/padrao.png");
  var message = "RESULTADO:";
  int wins = 0;
  int defeats = 0;
  int draw = 0;

  optionselect(String chooseuser) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var choose = Random().nextInt(3);
    var chooseApp = opcoes[choose];

    switch (chooseApp) {
      case "pedra":
        setState(() {
          imageApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          imageApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          imageApp = AssetImage("images/tesoura.png");
        });
    }

    if (chooseuser == "pedra" && chooseApp == "tesoura" ||
        chooseuser == "tesoura" && chooseApp == "papel" ||
        chooseuser == "papel" && chooseApp == "pedra") {
      setState(() {
        message = "VOCÊ VENCEU :)";
        wins++;
      });
    } else if (chooseApp == "pedra" && chooseuser == "tesoura" ||
        chooseApp == "tesoura" && chooseuser == "papel" ||
        chooseApp == "papel" && chooseuser == "pedra") {
      setState(() {
        message = "VOCÊ PERDEU :(";
        defeats++;
      });
    } else {
      setState(() {
        message = "EMPATAMOS :|";
        draw++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JOKENPO"),
        backgroundColor: Colors.blue,
        actions: [
          RaisedButton(
            color: Colors.blue,
            onPressed: () {
              setState(() {
                wins = 0;
                defeats = 0;
                draw = 0;
                imageApp = AssetImage("images/padrao.png");
                message = "RESULTADO:";
              });
            },
            child: Text(
              "ZERAR PLACAR",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              message,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 15, left: 5),
            child: Text(
              "ESCOLHA DO APP:",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: this.imageApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 32),
            child: Text(
              "ESCOLHA UMA OPÇÃO:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  optionselect("pedra");
                },
                child: Image.asset(
                  "images/pedra.png",
                  width: 120,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    optionselect("papel");
                  },
                  child: Image.asset(
                    "images/papel.png",
                    width: 120,
                  )),
              GestureDetector(
                  onTap: () {
                    optionselect("tesoura");
                  },
                  child: Image.asset(
                    "images/tesoura.png",
                    width: 120,
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 60)),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 65),
                child: Text(
                  "PEDRA",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 55),
                child: Text(
                  "PAPEL",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "TESOURA",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 18, bottom: 5),
                child: Text(
                  "VITÓRIAS:",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  wins.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              Text(
                "DERROTAS:",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  defeats.toString(),
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  "EMPATES:",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                draw.toString(),
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

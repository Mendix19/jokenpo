import 'package:flutter/material.dart';
import 'dart:math';

class game extends StatefulWidget {
  const game({Key? key}) : super(key: key);
  @override
  _gameState createState() => _gameState();
}

class _gameState extends State<game> {
  var _imageApp = AssetImage("images/padrao.png");
  var message = "Escolha do aplicativo";

  opcaoselecionada(String userchoose) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imageApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imageApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imageApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if (userchoose == "pedra" && escolhaApp == "tesoura" ||
        userchoose == "tesoura" && escolhaApp == "papel" ||
        userchoose == "papel" && escolhaApp == "pedra") {
      setState(() {
        message = "Você ganhou!";
      });
    } else if (escolhaApp == "pedra" && userchoose == "tesoura" ||
        escolhaApp == "tesoura" && userchoose == "papel" ||
        escolhaApp == "papel" && userchoose == "pedra") {
      setState(() {
        message = "Você perdeu!";
      });
    } else if (escolhaApp == userchoose) {
      message = "Empatamos!";
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("JOKENPO"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                this.message,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Image(
              image: this._imageApp,
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha uma opção",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      opcaoselecionada("pedra");
                    },
                    child: Image.asset(
                      "images/pedra.png",
                      width: 100,
                    )),
                GestureDetector(
                    onTap: () {
                      opcaoselecionada("papel");
                    },
                    child: Image.asset(
                      "images/papel.png",
                      width: 100,
                    )),
                GestureDetector(
                    onTap: () {
                      opcaoselecionada("tesoura");
                    },
                    child: Image.asset(
                      "images/tesoura.png",
                      width: 100,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text("Pedra"), Text("Papel"), Text("Tesoura")],
            )
          ],
        ));
  }
}

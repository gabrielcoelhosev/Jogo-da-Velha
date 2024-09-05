import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool oTurn = true;
  List<String> displayXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  String resultDeclaration = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Center(child: Text('Placar')),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(width: 5, color: Colors.redAccent),
                            color: Colors.yellow),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontFamily: 'Coiny',
                                fontSize: 64),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 2,
              child: Text(resultDeclaration),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
      }

      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //Primeira Linha
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'O jogador ' + displayXO[0] + ' Ganhou!';
      });
    }

    //Segunda Linha
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = 'O jogador ' + displayXO[3] + ' Ganhou!';
      });
    }

    //Terceira Linha
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'O jogador ' + displayXO[6] + ' Ganhou!';
      });
    }

    //Primeira Coluna
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'O jogador ' + displayXO[0] + ' Ganhou!';
      });
    }

    //Segunda Coluna
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'O jogador ' + displayXO[1] + ' Ganhou!';
      });
    }

    //Terceira Coluna
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'O jogador ' + displayXO[2] + ' Ganhou!';
      });
    }

    //Primeira Diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'O jogador ' + displayXO[0] + ' Ganhou!';
      });
    }
  }
}

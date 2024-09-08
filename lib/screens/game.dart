import 'dart:async';

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
  int attemps = 0;

  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  String resultDeclaration = '';
  bool winerFound = false;

  static const maxSeconds = 30;
  int seconds = maxSeconds;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    resetTimer();
    timer?.cancel();
  }

  void resetTimer() => seconds = maxSeconds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Jogador O',
                        style: TextStyle(
                            fontFamily: 'Coiny',
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      Text(
                        oScore.toString(),
                        style: const TextStyle(
                            fontFamily: 'Coiny',
                            color: Colors.white,
                            fontSize: 40),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Jogador X',
                        style: TextStyle(
                            fontFamily: 'Coiny',
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      Text(
                        xScore.toString(),
                        style: const TextStyle(
                            fontFamily: 'Coiny',
                            color: Colors.white,
                            fontSize: 40),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 5, color: Colors.black),
                            color: Colors.green),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: const TextStyle(
                                color: Colors.white,
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      resultDeclaration,
                      style: const TextStyle(
                          fontFamily: 'Coiny',
                          color: Colors.white,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    _buildTimer()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    final isRunning = timer == null ? false : timer!.isActive;

    if (isRunning) {
      setState(() {
        if (oTurn && displayXO[index] == '') {
          displayXO[index] = 'O';
          filledBoxes++;
        } else if (!oTurn && displayXO[index] == '') {
          displayXO[index] = 'X';
          filledBoxes++;
        }

        oTurn = !oTurn;
        _checkWinner();
      });
    }
  }

  void _checkWinner() {
    //Primeira Linha
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'O jogador ${displayXO[0]} Ganhou!';
        stopTimer();
        _updateScore(displayXO[0]);
      });
    }

    //Segunda Linha
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = 'O jogador ${displayXO[3]} Ganhou!';
        stopTimer();
        _updateScore(displayXO[3]);
      });
    }

    //Terceira Linha
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'O jogador ${displayXO[6]} Ganhou!';
        stopTimer();
        _updateScore(displayXO[6]);
      });
    }

    //Primeira Coluna
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'O jogador ${displayXO[0]} Ganhou!';
        stopTimer();
        _updateScore(displayXO[0]);
      });
    }

    //Segunda Coluna
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'O jogador ${displayXO[1]} Ganhou!';
        stopTimer();
        _updateScore(displayXO[1]);
      });
    }

    //Terceira Coluna
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'O jogador ${displayXO[2]} Ganhou!';
        stopTimer();
        _updateScore(displayXO[2]);
      });
    }

    //Primeira Diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'O jogador ${displayXO[0]} Ganhou!';
        stopTimer();
        _updateScore(displayXO[0]);
      });
    }

    //Segunda Diagonal
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'O jogador ${displayXO[6]} Ganhou!';
        stopTimer();
        _updateScore(displayXO[6]);
      });
    }
    if (filledBoxes == 9) {
      setState(() {
        resultDeclaration = 'Ninguém ganhou!';
        stopTimer();
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
    winerFound = true;
  }

  void _limparTela() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      resultDeclaration = '';
    });
    filledBoxes = 0;
  }

  Widget _buildTimer() {
    final isRunning = timer == null ? false : timer!.isActive;

    return isRunning
        ? SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1 - seconds / maxSeconds,
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 8,
                  backgroundColor: Colors.black,
                ),
                Center(
                  child: Text(
                    '$seconds',
                    style: const TextStyle(
                        fontFamily: 'coiny', color: Colors.white, fontSize: 40),
                  ),
                ),
              ],
            ))
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            onPressed: () {
              startTimer();
              _limparTela();
              attemps++;
            },
            child: Text(
              attemps == 0 ? 'Jogar' : 'Jogar denovo!',
              style: const TextStyle(
                  color: Colors.white, fontFamily: 'Coiny', fontSize: 20),
            ));
  }
}

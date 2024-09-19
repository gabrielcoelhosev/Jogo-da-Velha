import 'dart:async';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
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

  Timer? _timer;
  int seconds = 30;

  int caixasPreenchidas = 0;
  int placarO = 0;
  int placarX = 0;

  bool ganharam = false;

  String ganhador = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                'https://images.unsplash.com/photo-1567360425618-1594206637d2?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YmxhY2slMjBhbmQlMjByZWQlMjB3YWxscGFwZXJ8ZW58MHx8MHx8fDA%3D',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'O',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.red,
                              fontFamily: 'Coiny'),
                        ),
                        Text(
                          placarO.toString(),
                          style: const TextStyle(
                              fontSize: 35,
                              color: Colors.red,
                              fontFamily: 'Coiny'),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    IconButton(
                        onPressed: () {
                          _limparPlacar();
                        },
                        icon: const Icon(
                          Icons.cleaning_services_outlined,
                          color: Colors.red,
                        )),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'X',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.red,
                              fontFamily: 'Coiny'),
                        ),
                        Text(
                          placarX.toString(),
                          style: const TextStyle(
                              fontSize: 35,
                              color: Colors.red,
                              fontFamily: 'Coiny'),
                        )
                      ],
                    ),
                  ],
                )),
                Expanded(
                  flex: 4,
                  child: GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                    Border.all(width: 5, color: Colors.black),
                                color: Colors.red),
                            child: Center(
                              child: Text(
                                displayXO[index],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                    fontFamily: 'Coiny'),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Expanded(
                  child: Text(
                    ganhador,
                    style: const TextStyle(
                        color: Colors.red, fontSize: 27, fontFamily: 'Coiny'),
                  ),
                ),
                Text(
                  seconds.toString(),
                  style: const TextStyle(
                      fontFamily: 'Coiny', color: Colors.red, fontSize: 20),
                ),
                IconButton(
                    onPressed: () {
                      _limparTela();
                    },
                    icon: const Icon(
                      Icons.cleaning_services_outlined,
                      color: Colors.red,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (displayXO[index] == '') {
        if (oTurn) {
          displayXO[index] = 'O';
        } else {
          displayXO[index] = 'X';
        }
        caixasPreenchidas++;
        oTurn = !oTurn;

        if (caixasPreenchidas == 1) {
          _startTimer(); // Inicia o timer na primeira jogada
        }

        _checkWinner();
      }
    });
  }

  void _checkWinner() {
    // Checa todas as combinações de vitória possíveis
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        ganhador = 'O ganhador foi o ${displayXO[0]}';
        _placar(displayXO[0]);
        ganharam = true;
        _resetTimer();
      });
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        ganhador = 'O ganhador foi o ${displayXO[3]}';
        _placar(displayXO[3]);
        ganharam = true;
        _resetTimer();
      });
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        ganhador = 'O ganhador foi o ${displayXO[6]}';
        _placar(displayXO[6]);
        ganharam = true;
        _resetTimer();
      });
    }
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        ganhador = 'O ganhador foi o ${displayXO[0]}';
        _placar(displayXO[0]);
        ganharam = true;
        _resetTimer();
      });
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        ganhador = 'O ganhador foi o ${displayXO[1]}';
        _placar(displayXO[1]);
        ganharam = true;
        _resetTimer();
      });
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        ganhador = 'O ganhador foi o ${displayXO[2]}';
        _placar(displayXO[2]);
        ganharam = true;
        _resetTimer();
      });
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        ganhador = 'O ganhador foi o ${displayXO[0]}';
        _placar(displayXO[0]);
        ganharam = true;
        _resetTimer();
      });
    }
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        ganhador = 'O ganhador foi o ${displayXO[2]}';
        _placar(displayXO[2]);
        ganharam = true;
        _resetTimer();
      });
    } else if (caixasPreenchidas == 9 && ganharam == false) {
      ganhador = 'Deu velha!';
      _resetTimer();
    }
  }

  void _limparTela() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      ganhador = '';
      oTurn = true;
      ganharam = false;
      seconds = 30;
      caixasPreenchidas = 0;
      _timer?.cancel();
    });
  }

  void _placar(String ganhador) {
    setState(() {
      if (ganhador == 'X') {
        placarX++;
      } else if (ganhador == 'O') {
        placarO++;
      }
    });
    _reconhecerVencedor();
  }

  void _limparPlacar() {
    setState(() {
      placarO = 0;
      placarX = 0;
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          _resetTimer();
        }

        if (seconds == 0) {
          _AcabouTempo(context);
        }
      });
    });
  }

  void _resetTimer() {
    _timer?.cancel();
  }

  void _AcabouTempo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: const Text(
            'Alerta',
            style: TextStyle(color: Colors.black, fontFamily: 'Coiny'),
          ),
          content: const Text(
            'Acabou o Tempo!',
            style: TextStyle(color: Colors.black, fontFamily: 'Coiny'),
          ),
          actions: [
            TextButton(
              child: const Text(
                'Fechar',
                style: TextStyle(color: Colors.black, fontFamily: 'Coiny'),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _limparTela();
              },
            ),
          ],
        );
      },
    );
  }

  void _reconhecerVencedor() {
    if (placarO == 10) {
      setState(() {
        _JogadorOGanhou(context);
      });
    } else if (placarX == 10) {
      setState(() {
        _JogadorXGanhou(context);
      });
    }
  }

  void _JogadorOGanhou(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: const Text(
            'Vencedor',
            style: TextStyle(fontFamily: 'Coiny'),
          ),
          content: const Text('O jogador O ganhou!',
              style: TextStyle(fontFamily: 'Coiny')),
          actions: [
            TextButton(
              child: const Text(
                'Fechar',
                style: TextStyle(color: Colors.black, fontFamily: 'Coiny'),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _limparTela();
                _limparPlacar();
              },
            ),
          ],
        );
      },
    );
  }

  void _JogadorXGanhou(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: const Text(
            'Vencedor',
            style: TextStyle(color: Colors.black, fontFamily: 'Coiny'),
          ),
          content: const Text(
            'O jogador X ganhou!',
            style: TextStyle(color: Colors.black, fontFamily: 'Coiny'),
          ),
          actions: [
            TextButton(
              child: const Text(
                'Fechar',
                style: TextStyle(color: Colors.black, fontFamily: 'Coiny'),
              ),
              onPressed: () {
                _limparTela();
                _limparPlacar();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

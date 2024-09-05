import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(width: 5, color: Colors.redAccent),
                            color: Colors.yellow),
                        child: Center(
                          child: Text(
                            'O',
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
            const Expanded(
              flex: 2,
              child: Text('Cronometro'),
            ),
          ],
        ),
      ),
    );
  }
}

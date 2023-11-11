import 'package:flutter/material.dart';

void main() {
  runApp(NimGame());
}

class NimGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Jogo Nim'),
        ),
        body: NimBoard(),
      ),
    );
  }
}

class NimBoard extends StatefulWidget {
  @override
  _NimBoardState createState() => _NimBoardState();
}

class _NimBoardState extends State<NimBoard> {
  List<int> piles = [3, 5, 7]; // Número inicial de pedras em cada pilha
  int currentPlayer = 1; // Jogador atual (1 ou 2)
  bool gameOver = false;

  void removeStones(int pileIndex, int stonesToRemove) {
    if (gameOver || piles[pileIndex] < stonesToRemove) {
      return;
    }

    setState(() {
      piles[pileIndex] -= stonesToRemove;

      // Verifique se o jogo acabou
      if (piles.every((pile) => pile == 0)) {
        gameOver = true;
        currentPlayer = (currentPlayer == 1) ? 2 : 1;
      } else {
        currentPlayer = (currentPlayer == 1) ? 2 : 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Jogador $currentPlayer, é a sua vez.'),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NimPile(piles[0], () => removeStones(0, 1)),
            NimPile(piles[1], () => removeStones(1, 1)),
            NimPile(piles[2], () => removeStones(2, 1)),
          ],
        ),
        SizedBox(height: 20),
        if (gameOver)
          Text('Jogador $currentPlayer ganhou!', style: TextStyle(fontSize: 24)),
      ],
    );
  }
}

class NimPile extends StatelessWidget {
  final int stones;
  final Function onPressed;

  NimPile(this.stones, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '$stones',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
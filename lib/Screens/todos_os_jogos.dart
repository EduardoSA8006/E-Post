import 'package:e_post/Screens/functionsScreens/cards/gera_cards.dart';
import 'package:flutter/material.dart';

class JogosPage extends StatefulWidget {
  const JogosPage({super.key});

  @override
  State<JogosPage> createState() => _JogosPageState();
}

class _JogosPageState extends State<JogosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos os jogos'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            buildGameCard('GRUPO A', 'Qatar', 'Ecuador', 1, 2, '14 Nov'),
            buildGameCard('GRUPO B', 'England', 'Iran', 4, 2, '1 Nov'),
            buildGameCard('GRUPO C', 'Argentina', 'Mexico', 3, 0, '3 Nov'),
            buildGameCard('GRUPO A', 'Qatar', 'Ecuador', 1, 2, '14 Nov'),
            buildGameCard('GRUPO B', 'England', 'Iran', 4, 2, '1 Nov'),
            buildGameCard('GRUPO C', 'Argentina', 'Mexico', 3, 0, '3 Nov'),
            buildGameCard('GRUPO A', 'Qatar', 'Ecuador', 1, 2, '14 Nov'),
            buildGameCard('GRUPO B', 'England', 'Iran', 4, 2, '1 Nov'),
            buildGameCard('GRUPO C', 'Argentina', 'Mexico', 3, 0, '3 Nov'),
          ],
        ),
      ),
    );
  }
}

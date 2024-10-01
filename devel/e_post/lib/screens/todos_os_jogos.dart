import 'package:e_post/cards/gera_cards.dart';
import 'package:flutter/material.dart';

class JogosPage extends StatefulWidget {
  const JogosPage({super.key});

  @override
  State<JogosPage> createState() => _JogosPageState();
}

class _JogosPageState extends State<JogosPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}

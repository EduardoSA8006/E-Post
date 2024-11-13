import 'package:flutter/material.dart';

Widget buildGameCard(String group, String team1, String team2, int score1,
    int score2, String date) {
  return Card(
    child: Container(
      height: 200,
      width: 169,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 83, 131, 255),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_post/Screens/campeonatos.dart';
import 'package:e_post/Screens/functionsScreens/savedata.dart';
import 'package:e_post/Screens/home.dart';
import 'package:e_post/Screens/perfil.dart';
import 'package:e_post/Screens/tela_mapa.dart';
import 'package:e_post/database/db_helper.dart';
import 'package:e_post/json/enviaParaOServer.dart';
import 'package:flutter/material.dart';

BottomAppBar barraInferior(context) {
  return BottomAppBar(
    height: 70,
    notchMargin: 10.0,
    color: Colors.black,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        IconButton(
          icon: Icon(Icons.map, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MapPage()));
          },
        ),
        RawMaterialButton(
          elevation: 2,
          fillColor: Colors.white,
          padding: EdgeInsets.all(11),
          onPressed: () {
            addJogos({
              "modalidade": "Futebol",
              'data_campeonato': Timestamp.fromDate(DateTime(2025, 11, 1)),
              'horarioCampeonato': '11:30',
              'nome_campeonato': 'barSemLona',
              'localizacao': 'rua sem fundo',
              'times': ["Perdedores", "Vencedores"]
            }, "Futebol");
            addJogos({
              "modalidade": "Volleyball",
              'data_campeonato': Timestamp.fromDate(DateTime(2025, 11, 1)),
              'horarioCampeonato': '11:30',
              'nome_campeonato': 'barSemLona',
              'localizacao': 'rua sem fundo',
              'times': ["Figurantes", "Gabbs"]
            }, "Volleyball");
            addJogos({
              "modalidade": "Handball",
              'data_campeonato': Timestamp.fromDate(DateTime(2025, 11, 1)),
              'horarioCampeonato': '11:30',
              'nome_campeonato': 'barSemLona',
              'localizacao': 'rua sem fundo',
              'times': ["Bar sem lona", "viemos Jogar"]
            }, "Handball");
            addJogos({
              "modalidade": "Handball",
              'data_campeonato': Timestamp.fromDate(DateTime(2025, 11, 1)),
              'horarioCampeonato': '11:30',
              'nome_campeonato': 'barSemLona',
              'localizacao': 'rua sem fundo',
              'times': ["Bar sem lona", "viemos Jogar"]
            }, "Handball");
          },
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            size: 25,
          ),
        ),
        IconButton(
          icon: Icon(Icons.sports_soccer, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => CampeonatosPage()));
          },
        ),
        IconButton(
          icon: Icon(Icons.person, color: Colors.white),
          onPressed: () async {
            idUser = await DBHelper.instance.getLastUserId();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Perfil(idUser: idUser)));
          },
        ),
      ],
    ),
  );
}

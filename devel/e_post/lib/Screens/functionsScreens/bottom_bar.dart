import 'package:e_post/Screens/campeonatos.dart';
import 'package:e_post/Screens/functionsScreens/savedata.dart';
import 'package:e_post/Screens/home.dart';
import 'package:e_post/Screens/perfil.dart';
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
          onPressed: () => print(0),
        ),
        RawMaterialButton(
          elevation: 2,
          fillColor: Colors.white,
          padding: EdgeInsets.all(11),
          onPressed: () {},
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
            size: 25,
          ),
        ),
        IconButton(
          icon: Icon(Icons.sports_soccer, color: Colors.white),
          onPressed: () {
            addJsonData({
              'title': 'Jogo 1',
              'content': {
                'nome_campeonato': 'barSemLona',
                'horarioCampeonato': '11:30',
                'data_campeonato': '11/02/2025',
                'localizacao': 'rua sem fundo',
                'times': []
              },
            });
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

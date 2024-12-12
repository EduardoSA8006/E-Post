import 'package:e_post/Screens/campeonatos.dart';
import 'package:e_post/Screens/criar_campeonatos.dart';
import 'package:e_post/Screens/functionsScreens/savedata.dart';
import 'package:e_post/Screens/perfil.dart';
import 'package:e_post/Screens/tela_mapa.dart';
import 'package:e_post/database/db_helper.dart';
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
          onPressed: () {},
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CriaCampeonatosPage()));
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

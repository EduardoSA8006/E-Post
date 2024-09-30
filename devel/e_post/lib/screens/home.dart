import 'dart:ffi';

import 'package:e_post/cards/gera_cards.dart';
import 'package:e_post/screens/configuracoes.dart';
import 'package:e_post/screens/notificacoes.dart';
import 'package:e_post/screens/todos_os_jogos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'E-Post',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Color.fromARGB(255, 11, 28, 172),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Image.asset(
                  "assets/images/icon.png",
                  height: 50,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotoficationPage(),
                    ),
                  );
                },
                icon: Icon(Icons.notifications_rounded)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.settings,
                  size: 27,
                ))
          ],
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          alignment: Alignment.center,
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: const Color.fromARGB(255, 83, 131, 255),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Próximas partidas',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              SizedBox(
                height: 7,
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color.fromARGB(255, 83, 131, 255),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Text(
                    'Futebol',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Container(
                      height: 200,
                      width: 169,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 83, 131, 255),
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 200,
                      width: 169,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 83, 131, 255),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 83, 131, 255),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Resultado dos jogos',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          child: Row(
                            children: [
                              Text(
                                'ver todos',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JogosPage(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    buildGameCard(
                        'GRUPO A', 'Qatar', 'Ecuador', 1, 2, '14 Nov'),
                    buildGameCard('GRUPO B', 'England', 'Iran', 4, 2, '1 Nov'),
                    buildGameCard(
                        'GRUPO C', 'Argentina', 'Mexico', 3, 0, '3 Nov'),
                    // Adicione mais cards conforme necessário
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        floatingActionButtonLocation: CustomFloatingActionButtonLocation(50),
        bottomNavigationBar: BottomAppBar(
          height: 70,
          notchMargin: 10.0,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: Icon(Icons.map, color: Colors.white),
                onPressed: () => _onItemTapped(1),
              ),
              SizedBox(width: 40), // Espaço para o FloatingActionButton
              IconButton(
                icon: Icon(Icons.sports_soccer, color: Colors.white),
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.white),
                onPressed: () => _onItemTapped(3),
              ),
            ],
          ),
        ));
  }
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  final double offsetY;

  CustomFloatingActionButtonLocation(this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width -
            scaffoldGeometry.floatingActionButtonSize.width) /
        2;
    final double fabY = scaffoldGeometry.scaffoldSize.height -
        scaffoldGeometry.floatingActionButtonSize.height -
        56 +
        offsetY;

    return Offset(fabX, fabY);
  }
}

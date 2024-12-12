import 'package:e_post/Screens/functionsScreens/bottom_bar.dart';
import 'package:flutter/services.dart';
import 'package:e_post/screens/configuracoes.dart';
import 'package:e_post/screens/notificacoes.dart';
import 'package:e_post/screens/todos_os_jogos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaltPage extends StatefulWidget {
  const DefaltPage({super.key});

  @override
  State<DefaltPage> createState() => _DefaltPageState();
}

class _DefaltPageState extends State<DefaltPage> {
  int tela = 0;

  void _clicou(int index) {
    setState(() {
      tela = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    
    
    final List<Widget> widgetOptions = [
      Scaffold(
        backgroundColor: Colors.grey[300],
        body: (),
      ),
      
    ];

    return Scaffold(
      body: widgetOptions.elementAt(tela),,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: tela,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 1,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 1,
          ),
          onTap: (a) {
            _clicou(a);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 27,
              ),
              label: '',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map_outlined,
                size: 27,
              ),
              label: '',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: RawMaterialButton(
                padding: EdgeInsets.all(9),
                constraints: BoxConstraints(),
                onPressed: () {},
                shape: CircleBorder(),
                fillColor: Colors.white,
                child: Icon(
                  Icons.add,
                  size: 27,
                  color: Colors.black,
                ),
              ),
              label: '',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.sports_soccer_outlined,
                size: 27,
              ),
              label: '',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outlined,
                size: 27,
              ),
              label: '',
              backgroundColor: Colors.white,
            ),
          ],
        ));
  }
}

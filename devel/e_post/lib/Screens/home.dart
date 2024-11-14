import 'package:e_post/Screens/functionsScreens/bottom_bar.dart';
import 'package:flutter/services.dart';
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
  String? selectedValue;
  final List<String> items = ['Futebol', 'Basquete', 'Voleibol'];

  void _onItemTapped(int index) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
                    color: Color.fromRGBO(11, 28, 172, 1),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Image.asset(
                  "assets/images/icone.png",
                  height: 50,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
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
                  height: 35,
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
                  height: 35,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: const Color.fromARGB(255, 83, 131, 255),
                  ),
                  child: DropdownButton<String>(
                    value: selectedValue,
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    },
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                    underline: SizedBox.shrink(),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                  )),
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
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 83, 131, 255),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                    height: 30,
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
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
                            'Locais em destaque',
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
              ),
            ],
          ),
        ),
        bottomNavigationBar: barraInferior(context));
  }
}

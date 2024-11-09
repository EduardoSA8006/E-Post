import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_post/Screens/functionsScreens/bottom_bar.dart';
import 'package:e_post/Screens/functionsScreens/jogos/exibir_todos.dart';
import 'package:e_post/Screens/functionsScreens/jogos/exibir_uma_modalidade.dart';
import 'package:e_post/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rxdart/rxdart.dart';

class CampeonatosPage extends StatefulWidget {
  const CampeonatosPage({super.key});

  @override
  State<CampeonatosPage> createState() => _CampeonatosPageState();
}

bool partidas = true;
bool amistosos = false;
bool competicoes = false;

bool todosOsJogos = true;
bool futebol = false;
bool futsal = false;
bool handball = false;
bool volei = false;
bool outros = false;
bool basket = false;

class _CampeonatosPageState extends State<CampeonatosPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  List<bool> notificacoes = [];

  void atualizaPagina() {
    setState(() {});
  }

  TextStyle stiloTextoBotaoAtivo(modalidade) {
    if (modalidade) {
      return GoogleFonts.inter(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16);
    } else {
      return GoogleFonts.inter(
          color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16);
    }
  }

  MaterialStateProperty<Color?>? corBotao(modalidade) {
    if (modalidade) {
      return WidgetStatePropertyAll(Color.fromARGB(255, 0, 111, 237));
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 6, 43, 253),
            title: InkWell(
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  Text(
                    "Voltar",
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            actions: [
              IconButton(
                  onPressed: atualizaPagina,
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ))
            ],
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(10),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  partidas = true;
                                  amistosos = false;
                                  competicoes = false;
                                });
                              },
                              child: Text(
                                "Partidas",
                                style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                          Transform.translate(
                              offset: Offset(0, -6),
                              child: Container(
                                height: 2,
                                width: 70,
                                color: partidas ? Colors.white : null,
                              ))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  partidas = false;
                                  amistosos = true;
                                  competicoes = false;
                                });
                              },
                              child: Text(
                                "Amistosos",
                                style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                          Transform.translate(
                            offset: Offset(0, -6),
                            child: Container(
                              height: 2,
                              width: 90,
                              color: amistosos ? Colors.white : null,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  competicoes = true;
                                  partidas = false;
                                  amistosos = false;
                                });
                              },
                              child: Text(
                                "Competições",
                                style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                          Transform.translate(
                              offset: Offset(0, -6),
                              child: Container(
                                height: 2,
                                width: 100,
                                color: competicoes ? Colors.white : null,
                              ))
                        ],
                      )
                    ],
                  ),
                )),
          )),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                      style:
                          ButtonStyle(backgroundColor: corBotao(todosOsJogos)),
                      onPressed: () {
                        setState(() {
                          todosOsJogos = true;
                          futebol = false;
                          futsal = false;
                          handball = false;
                          volei = false;
                          outros = false;
                          basket = false;
                        });
                      },
                      child: Text(
                        "Todos os esportes",
                        style: stiloTextoBotaoAtivo(todosOsJogos),
                      )),
                  SizedBox(width: 10),
                  ElevatedButton(
                      style: ButtonStyle(backgroundColor: corBotao(futebol)),
                      onPressed: () {
                        setState(() {
                          todosOsJogos = false;
                          futebol = true;
                          futsal = false;
                          handball = false;
                          volei = false;
                          outros = false;
                          basket = false;
                        });
                      },
                      child: Text(
                        "Futebol",
                        style: stiloTextoBotaoAtivo(futebol),
                      )),
                  SizedBox(width: 10),
                  ElevatedButton(
                      style: ButtonStyle(backgroundColor: corBotao(futsal)),
                      onPressed: () {
                        setState(() {
                          todosOsJogos = false;
                          futebol = false;
                          futsal = true;
                          handball = false;
                          volei = false;
                          outros = false;
                          basket = false;
                        });
                      },
                      child: Text(
                        "Futsal",
                        style: stiloTextoBotaoAtivo(futsal),
                      )),
                  SizedBox(width: 10),
                  ElevatedButton(
                      style: ButtonStyle(backgroundColor: corBotao(handball)),
                      onPressed: () {
                        setState(() {
                          todosOsJogos = false;
                          futebol = false;
                          futsal = false;
                          handball = true;
                          volei = false;
                          outros = false;
                          basket = false;
                        });
                      },
                      child: Text(
                        "Handball",
                        style: stiloTextoBotaoAtivo(handball),
                      )),
                  SizedBox(width: 10),
                  ElevatedButton(
                      style: ButtonStyle(backgroundColor: corBotao(volei)),
                      onPressed: () {
                        setState(() {
                          todosOsJogos = false;
                          futebol = false;
                          futsal = false;
                          handball = false;
                          volei = true;
                          outros = false;
                          basket = false;
                        });
                      },
                      child: Text(
                        "Volleyball",
                        style: stiloTextoBotaoAtivo(volei),
                      )),
                  SizedBox(width: 10),
                  ElevatedButton(
                      style: ButtonStyle(backgroundColor: corBotao(basket)),
                      onPressed: () {
                        setState(() {
                          todosOsJogos = false;
                          futebol = false;
                          futsal = false;
                          handball = false;
                          volei = false;
                          outros = false;
                          basket = true;
                        });
                      },
                      child: Text(
                        "Basketball",
                        style: stiloTextoBotaoAtivo(basket),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(backgroundColor: corBotao(outros)),
                      onPressed: () {
                        setState(() {
                          todosOsJogos = false;
                          futebol = false;
                          futsal = false;
                          handball = false;
                          volei = false;
                          outros = true;
                          basket = false;
                        });
                      },
                      child: Text(
                        "Outros",
                        style: stiloTextoBotaoAtivo(outros),
                      )),
                ],
              ),
            ),
            Expanded(
                child: todosOsJogos
                    ? todos(notificacoes, atualizaPagina)
                    : futebol
                        ? mostraUmaModalidade("Futebol", atualizaPagina)
                        : futsal
                            ? mostraUmaModalidade("Futsal", atualizaPagina)
                            : volei
                                ? mostraUmaModalidade(
                                    "Volleyball", atualizaPagina)
                                : basket
                                    ? mostraUmaModalidade(
                                        "Basketball", atualizaPagina)
                                    : handball
                                        ? mostraUmaModalidade(
                                            "Handball", atualizaPagina)
                                        : mostraUmaModalidade(
                                            "Outros", atualizaPagina))
          ],
        ),
      ),
      bottomNavigationBar: barraInferior(context),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_post/Screens/functionsScreens/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CampeonatosPage extends StatefulWidget {
  const CampeonatosPage({super.key});

  @override
  State<CampeonatosPage> createState() => _CampeonatosPageState();
}

bool partidas = true;
bool amistosos = false;
bool competicoes = false;

class _CampeonatosPageState extends State<CampeonatosPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 6, 43, 253),
            title: Row(
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('jsonData').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.docs.map((doc) {
              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['title'] ?? 'No Title'),
                subtitle: Text(
                    data['content'].toString()), // Exibe o JSON como string
              );
            }).toList(),
          );
        },
      ),
      bottomNavigationBar: barraInferior(context),
    );
  }
}

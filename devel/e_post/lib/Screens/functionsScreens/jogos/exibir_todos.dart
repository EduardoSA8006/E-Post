import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

dynamic modalidade;

StreamBuilder<List<QuerySnapshot<Map<String, dynamic>>>> todos(
    List<bool> notificacoes, atualizaPagina) {
  return StreamBuilder<List<QuerySnapshot<Map<String, dynamic>>>>(
      stream: Rx.zip5(
        FirebaseFirestore.instance
            .collection('Futebol')
            .orderBy('data_campeonato', descending: true)
            .snapshots(),
        FirebaseFirestore.instance
            .collection('Futsal')
            .orderBy('data_campeonato', descending: true)
            .snapshots(),
        FirebaseFirestore.instance
            .collection('Volleyball')
            .orderBy('data_campeonato', descending: true)
            .snapshots(),
        FirebaseFirestore.instance
            .collection('Handball')
            .orderBy('data_campeonato', descending: true)
            .snapshots(),
        FirebaseFirestore.instance
            .collection('Basketball')
            .orderBy('data_campeonato', descending: true)
            .snapshots(),
        (QuerySnapshot<Map<String, dynamic>> Futebol,
            QuerySnapshot<Map<String, dynamic>> Futsal,
            QuerySnapshot<Map<String, dynamic>> Volleyball,
            QuerySnapshot<Map<String, dynamic>> Handball,
            QuerySnapshot<Map<String, dynamic>> Basketball) {
          return [Futebol, Futsal, Volleyball, Handball, Basketball];
        },
      ),
      builder: (context,
          AsyncSnapshot<List<QuerySnapshot<Map<String, dynamic>>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        var futebol = snapshot.data![0].docs;
        var futsal = snapshot.data![1].docs;
        var volleyball = snapshot.data![2].docs;
        var handball = snapshot.data![3].docs;
        var basketball = snapshot.data![4].docs;

        var jogos = [];
        jogos.addAll(futebol);
        jogos.addAll(futsal);
        jogos.addAll(volleyball);
        jogos.addAll(handball);
        jogos.addAll(basketball);

        if (jogos.length == 0) {
          return Center(
            child: Text("Nenhum jogo encontrado."),
          );
        } else {
          return ListView.builder(
            itemCount: jogos.length,
            itemBuilder: (context, index) {
              var doc = jogos[index];
              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

              return Container(
                height: 80,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 16, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(data['horarioCampeonato']?.toString() ??
                            'No Content'),
                        SizedBox(width: 10),
                        Container(
                          color: Color.fromARGB(150, 73, 69, 79),
                          width: 2,
                          height: 35,
                        ),
                        SizedBox(width: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon((data["modalidade"].toString() == "Futebol")
                                ? Icons.sports_soccer
                                : (data["modalidade"].toString() == "Handball")
                                    ? Icons.sports_handball
                                    : (data["modalidade"].toString() ==
                                            "Volleyball")
                                        ? Icons.sports_volleyball
                                        : (data["modalidade"].toString() ==
                                                "Futsal")
                                            ? Icons.sports_soccer_outlined
                                            : (data["modalidade"].toString() ==
                                                    "Basketball")
                                                ? Icons.sports_basketball
                                                : (data["modalidade"]
                                                            .toString() ==
                                                        "Outros")
                                                    ? Icons.more_horiz_outlined
                                                    : null),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(data["times"][0]?.toString() ??
                                    'No Content'),
                                Text(data['times'][1]?.toString() ??
                                    'No Content'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          color: Color.fromARGB(150, 73, 69, 79),
                          width: 2,
                          height: 35,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications_off_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
      });
}

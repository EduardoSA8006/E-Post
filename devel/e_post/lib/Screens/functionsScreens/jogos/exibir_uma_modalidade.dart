import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

dynamic modalidade;

StreamBuilder mostraUmaModalidade(String modalidade, atualizaPagina) {
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection(modalidade).snapshots(),
    builder: (context, AsyncSnapshot snapshot) {
      if (snapshot.hasError) {
        return Center(child: Text('Erro: ${snapshot.error}'));
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }

      var itens = snapshot.data!.docs;

      if (itens.length == 0) {
        return Center(
          child: Text("Nenhum jogo encontrado."),
        );
      } else {
        return ListView.builder(
          itemCount: itens.length,
          itemBuilder: (context, index) {
            var doc = itens[index];
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
                              Text(
                                  data["times"][0]?.toString() ?? 'No Content'),
                              Text(
                                  data['times'][1]?.toString() ?? 'No Content'),
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
    },
  );
}

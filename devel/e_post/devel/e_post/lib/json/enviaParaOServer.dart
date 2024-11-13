import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addJogos(Map<String, dynamic> jogo, String modalidade) async {
  await FirebaseFirestore.instance
      .collection(modalidade)
      .add(jogo)
      .catchError((error) => print("Erro ao adicionar JSON: $error"));
}

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addJsonData(Map<String, dynamic> jsonData) async {
  await FirebaseFirestore.instance
      .collection('jsonData')
      .add(jsonData)  // Cria um novo documento com um ID único
      .catchError((error) => print("Erro ao adicionar JSON: $error"));
}

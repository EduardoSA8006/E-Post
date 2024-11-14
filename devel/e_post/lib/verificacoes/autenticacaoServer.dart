import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:e_post/main.dart';

class AutenticacaoServer {

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  cadastrarUsuario({
    required String email,
    required String senha,
    required dynamic context,
  }) async {
    try {
      UserCredential userCrede = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      userUid = FirebaseAuth.instance.currentUser?.uid;
      // Se o cadastro for bem-sucedido, você pode prosseguir com o restante do fluxo
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // O email já está cadastrado

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Já existe um usúario com esse email')),
        );

        // Aqui, você pode exibir uma mensagem para o usuário ou tratar o erro de outra forma
      } else {
        // Tratar outros tipos de erro
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ocorreu o erro: ${e.message}')),
        );
      }
    }

  }

    Future<void> salvarNome({required nome, required userId}) async {
      DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(userId);
      await userDoc.set({
        'Nome': nome,
      }, SetOptions(merge: true));
  }

  Future<void> salvarNumero({required telefone, required userId})async  {
    DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(userId);
    await userDoc.set({
      'Telefone': telefone,
    }, SetOptions(merge: true));
  }



Future<void> saveUserDateOfBirth({required userId, required DateTime dateOfBirth}) async {
  // Converta a data de nascimento para Timestamp do Firestore
  Timestamp birthDate = Timestamp.fromDate(dateOfBirth);

  // Referência para o documento do usuário no Firestore
  DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(userId);

  // Salve ou atualize a data de nascimento no Firestore
  await userDoc.set({
    'Data de nascimento': birthDate,
  }, SetOptions(merge: true)); // `merge: true` evita sobrescrever outros dados
}



Future<bool> checkIfAccountExists(String email) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Consulta a coleção 'users' para um documento com o campo 'email' igual ao email fornecido
    final querySnapshot = await firestore.collection('users')
        .where('email', isEqualTo: email)
        .get();

    // Retorna verdadeiro se encontrar ao menos um documento com o email
    return querySnapshot.docs.isNotEmpty;
  } catch (e) {
    return false;
  }
}

Future<User?> loginUser(String email, String senha, context) async {
  try {
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: senha,
    );
    return userCredential.user;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('1');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nenhum usuário encontrado para esse email.')),
      );
    } else if (e.code == 'wrong-password') {
      print('2');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Senha incorreta.')),
      );
    }
  } catch (e) {
    print('3');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Ocorreu um erro ao fazer Login: ${e}')),
    );
  }
  return null;
}

}

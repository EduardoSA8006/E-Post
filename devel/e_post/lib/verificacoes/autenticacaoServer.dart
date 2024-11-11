import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AutenticacaoServer {

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  cadastrarUsuario({
    required String nome,
    required String email,
    required String senha,
    String? telefone,
    DateTime? dataNascimento,
  }) async {
    UserCredential userCrede = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha);

    await userCrede.user!.updateDisplayName(nome);
    if (telefone != null){
      await userCrede.user!.updatePhoneNumber(telefone as PhoneAuthCredential);
    }

    if (dataNascimento != null) {
      await saveUserDateOfBirth(userCrede.user!.uid, dataNascimento);
    }

  }
}


Future<void> saveUserDateOfBirth(String userId, DateTime dateOfBirth) async {
  // Converta a data de nascimento para Timestamp do Firestore
  Timestamp birthDate = Timestamp.fromDate(dateOfBirth);

  // Referência para o documento do usuário no Firestore
  DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(userId);

  // Salve ou atualize a data de nascimento no Firestore
  await userDoc.set({
    'dateOfBirth': birthDate,
  }, SetOptions(merge: true)); // `merge: true` evita sobrescrever outros dados
}

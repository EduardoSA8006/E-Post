import 'package:flutter/material.dart';
import 'package:e_post/main.dart';

class AutenticacaoServer {

  cadastrarUsuario({
    required String email,
    required String senha,
    required dynamic context,
  }) async {
    // TODO: implementar cadastro sem Firebase
  }

  Future<void> salvarNome({required nome, required userId}) async {
    // TODO: implementar salvar nome sem Firebase
  }

  Future<void> salvarNumero({required telefone, required userId}) async {
    // TODO: implementar salvar número sem Firebase
  }

  Future<void> saveUserDateOfBirth({required userId, required DateTime dateOfBirth}) async {
    // TODO: implementar salvar data de nascimento sem Firebase
  }

  Future<bool> checkIfAccountExists(String email) async {
    // TODO: implementar verificação de conta sem Firebase
    return false;
  }

  Future<dynamic> loginUser(String email, String senha, context) async {
    // TODO: implementar login sem Firebase
    return null;
  }
}

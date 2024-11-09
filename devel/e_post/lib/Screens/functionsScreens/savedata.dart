import 'package:e_post/database/db_helper.dart';
import 'package:e_post/model/user.dart';

Map<String, dynamic> dados = {};

Future<void> submitForm() async {
  final user = User(
      name: dados['name'],
      email: dados['email'],
      senha: dados['senha'],
      telefone: dados['telefone'] != false ? dados['telefone'] : '',
      dataNascimento: DateTime.parse(dados['data_nascimento']));

  await DBHelper.instance.addUser(user);
}

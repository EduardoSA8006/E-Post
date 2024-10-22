import 'package:e_post/database/db_helper.dart';
import 'package:e_post/model/user.dart';

Map<String, dynamic> dados = Map();

Future<void> submitForm() async {
  final user = User(
      name: dados['name'],
      email: dados['email'],
      senha: dados['senha'],
      dataNascimento: dados['data_nascimento']);

  await DBHelper.instance.addUser(user);
}

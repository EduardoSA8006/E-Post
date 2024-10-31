import 'package:e_post/database/db_helper.dart';
import 'package:e_post/model/user.dart';

class AutenticacaoLogin{
  Future<bool> login(String email, String senha) async {
    //Tenta buscar o usuario pelo email
    final db = DBHelper.instance;
    final user = await db.fetchUserByEmail(email);

    // Verifica se o usuário foi encontrado e se a senha está correta
    if(user != null && user.senha == senha){
      return true;
    }else {
      return false;
    }
  }
}
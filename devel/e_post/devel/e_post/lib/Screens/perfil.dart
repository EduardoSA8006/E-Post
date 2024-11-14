import 'package:e_post/Screens/functionsScreens/bottom_bar.dart';
import 'package:e_post/Screens/functionsScreens/savedata.dart';
import 'package:e_post/Screens/perfileditavel.dart';
import 'package:e_post/database/db_helper.dart';
import 'package:e_post/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Perfil extends StatefulWidget {
  final int? idUser; // Recebe o ID do usuário logado

  const Perfil({super.key, required this.idUser});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late Future<User?> userFuture;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    userFuture = DBHelper.instance.fetchUserById(idUser!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User?>(
        future: userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Carregando
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar perfil'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('Usuário não encontrado'));
          }

          final user = snapshot.data!;

          return Column(
            children: [
              SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                height: 225,
                width: double.infinity,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: user.fotoPerfil != null
                          ? NetworkImage(user.fotoPerfil!) // Usa a imagem do banco de dados
                          : AssetImage('assets/images/logoGoogle.png')
                      as ImageProvider,
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PerfilEditavel(user: user)),
                            );
                          },
                          icon: Icon(Icons.edit, color: Colors.white, size: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 400,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _buildInfoRow('Bio', user.bio ?? 'Bio não fornecida'),
                      _buildInfoRow('Nome Completo', user.name),
                      _buildInfoRow('Nome de exibição', user.name),
                      _buildInfoRow('Data de nascimento',
                          user.dataNascimento.toLocal().toString().split(' ')[0]),
                      SizedBox(height: 40),
                      CupertinoButton(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                        child: Text('Alterar informações'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PerfilEditavel(user: user)),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: barraInferior(context)
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      width: double.infinity,
      height: 75,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              color: Color.fromARGB(255, 6, 45, 253),
              fontSize: 20,
            ),
          ),
          Text(
            '   $value',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}

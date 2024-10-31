import 'package:e_post/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerfilEditavel extends StatefulWidget {
  final User user; // Recebe o objeto User

  const PerfilEditavel({Key? key, required this.user}) : super(key: key);

  @override
  State<PerfilEditavel> createState() => _PerfilEditavelState();
}

class _PerfilEditavelState extends State<PerfilEditavel> {
  late TextEditingController _bioController;
  late TextEditingController _nomeCompletoController;
  late TextEditingController _nomeExibicaoController;
  late TextEditingController _dataNascimentoController;

  @override
  void initState() {
    super.initState();
    // Inicializa os controladores com os dados do usuário
    _bioController = TextEditingController(text: widget.user.bio);
    _nomeCompletoController = TextEditingController(text: widget.user.name);
    _nomeExibicaoController = TextEditingController(text: widget.user.name);
    _dataNascimentoController = TextEditingController(
      text: widget.user.dataNascimento.toLocal().toString().split(' ')[0],
    );
  }

  @override
  void dispose() {
    _bioController.dispose();
    _nomeCompletoController.dispose();
    _nomeExibicaoController.dispose();
    _dataNascimentoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  backgroundImage: widget.user.fotoPerfil != null
                      ? NetworkImage(widget.user.fotoPerfil!)
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
                      onPressed: () {},
                      icon: Icon(Icons.edit, color: Colors.white, size: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 350,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildInfoRow('Bio', _bioController),
                  _buildInfoRow('Nome Completo', _nomeCompletoController),
                  _buildInfoRow('Nome de exibição', _nomeExibicaoController),
                  _buildInfoRow('Data de nascimento', _dataNascimentoController),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          CupertinoButton(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue,
            child: Text('Salvar Informações'),
            onPressed: () {
              // Aqui você pode implementar o código para salvar as informações no banco
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, TextEditingController controller) {
    return Container(
      width: double.infinity,
      height: 100,
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
          TextFormField(controller: controller),
        ],
      ),
    );
  }
}

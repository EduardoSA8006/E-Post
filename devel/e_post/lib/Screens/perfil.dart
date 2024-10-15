import 'package:e_post/Screens/perfileditavel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.center,
            //color: Colors.blue,
            height: 225,
            width: double.infinity,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(
                      'assets/images/logoGoogle.png'), //tem que trocar e pegar o caminho da imagen do banco de dados e colocar aqui pra pegar a imagem no servidor
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            //color: Colors.green,
            height: 400,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    //color: Colors.red,
                    width: double.infinity,
                    height: 75,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Bio',
                          style: TextStyle(
                            color: Color.fromARGB(255, 6, 45, 253),
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '   vai ser vazio do padrão mas pode ser editado pelo usuario vir do BD',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.red,
                    width: double.infinity,
                    height: 75,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Nome Completo',
                          style: TextStyle(
                            color: Color.fromARGB(255, 6, 45, 253),
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '   Nome que vai vir do BD',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.red,
                    width: double.infinity,
                    height: 75,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Nome de exibição',
                          style: TextStyle(
                            color: Color.fromARGB(255, 6, 45, 253),
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '   Nome que vai vir do BD',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.red,
                    width: double.infinity,
                    height: 75,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'data de nascimento',
                          style: TextStyle(
                            color: Color.fromARGB(255, 6, 45, 253),
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'vai vir do BD',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    //color: Colors.amber,
                    child: CupertinoButton(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                        child: Text('Alterar informações'),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PerfilEditavel()));
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

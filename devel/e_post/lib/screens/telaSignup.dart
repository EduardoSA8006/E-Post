import 'package:e_post/Screens/login.dart';
import 'package:e_post/Screens/telaSignUp2.dart';
import 'package:e_post/verificacoes/email.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_post/verificacoes/senha.dart';
import 'package:e_post/verificacoes/autenticacaoServer.dart';


class TelaSignup extends StatefulWidget {
  const TelaSignup({super.key});

  @override
  _TelaSignupState createState() => _TelaSignupState();
}

class _TelaSignupState extends State<TelaSignup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController _confirmaSenhaController =
      TextEditingController();
  bool _mostrarSenha1 = false;
  bool _mostrarSenha = false;

  AutenticacaoServer _autServer = AutenticacaoServer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              width: double.infinity,
              height: 75,
              color: Colors.white,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        'E-Post',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Color.fromARGB(255, 11, 28, 172),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Image.asset(
                        "assets/images/icon.png",
                        height: 55,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              color: Colors.white,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Crie sua conta",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: const Color.fromARGB(255, 11, 28, 172),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Digite seu e-mail para se inscrever neste aplicativo",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 11, 28, 172),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: validarEmail,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Email',
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 83, 131, 255),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 16,
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: senhaController,
                          validator: validarSenha,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  _mostrarSenha
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _mostrarSenha =
                                        !_mostrarSenha; // Alterna a visibilidade da senha
                                  });
                                }),
                            labelText: 'Crie uma Senha',
                            labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 83, 131, 255),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 16,
                            ),
                          ),
                          obscureText: !_mostrarSenha,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _confirmaSenhaController,
                          validator: (value) {
                            return verificaConfirmeSenha(
                                value, senhaController.text);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Confirme a senha',
                            suffixIcon: IconButton(
                                icon: Icon(
                                  _mostrarSenha1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _mostrarSenha1 = !_mostrarSenha1;
                                  });
                                }),
                            labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 83, 131, 255),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 16,
                            ),
                          ),
                          obscureText: !_mostrarSenha1,
                        ),
                      ],
                    ),
                  ),

                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TelaLogin()),
                        );
                      },

                      child: Text(
                        'Já tem uma conta? Faça login',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 55, 103, 226),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 6, 45, 253),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 100.0,
                  ),
                ),
                child: const Text(
                  'Continuar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    bool accountExists = await _autServer.checkIfAccountExists(emailController.text);
                    if (accountExists){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Já existe um usúario com esse email')),
                      );
                      emailController.clear();
                    }else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TelaSignup2(
                              emailController: emailController.text,
                              senhaController: senhaController.text,
                            )),
                      );
                    }

                  }
                },
              ),
            ),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      height: 1.0,
                      color: const Color.fromARGB(255, 55, 103, 226),
                    ),
                  ),
                  const Text(
                    "ou continue com o google",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 55, 103, 226),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8.0),
                      height: 1.0,
                      color: const Color.fromARGB(255, 55, 103, 226),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 0, 16, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 238, 238, 238),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 118,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Image.asset(
                        "assets/images/logoGoogle.png",
                        height: 25,
                      ),
                    ),
                    const Text(
                      'Google',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 6, 45, 253),
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Ao clicar em continuar, você concorda com nossos Termos de Serviço e Política de Privacidade',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 57, 135, 252)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

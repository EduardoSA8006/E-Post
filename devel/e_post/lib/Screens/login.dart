import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          // Added SingleChildScrollView to avoid overflow
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                width: double.infinity,
                height: 75,
                color: Colors.white, //fromARGB(255, 255, 255, 255),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
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
                      SizedBox(width: 10), // Add space between text and image
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Image.asset(
                          "assets/icone.png",
                          height: 55,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                color: Colors.white, //fromARGB(255, 255, 255, 255),
                padding: EdgeInsets.all(
                    16.0), // Added padding for better text alignment
                child: Column(
                  children: <Widget>[
                    Text(
                      "Entre em sua conta",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 11, 28, 172),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10), // Added space between texts
                    Text(
                      "Entre com Email ou com o Google",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 11, 28, 172),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                color: Colors.white, //fromARGB(255, 255, 255, 255),
                padding:
                    EdgeInsets.all(16.0), // Added padding for better alignment
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 83, 131, 255),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 16,
                          )),
                    ),
                    SizedBox(
                        height: 20), // Space between email and password fields
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 83, 131, 255),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 16,
                        ),
                      ),
                      obscureText: true, // Hides the password text
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white, //fromARGB(255, 255, 255, 255),
                margin: EdgeInsets.fromLTRB(16, 10, 16, 0),
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Não tem uma conta? Crie uma.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 55, 103, 226),
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 9, 44, 131),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                padding: EdgeInsets.all(0.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 6, 45, 253),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 100.0,
                    ),
                  ),
                  child: Text(
                    'Siga com o email',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 8.0),
                        height: 1.0,
                        color: Color.fromARGB(255, 55, 103, 226),
                      ),
                    ),
                    Text(
                      "ou continue com o google",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 55, 103, 226),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 8.0),
                        height: 1.0,
                        color: Color.fromARGB(255, 55, 103, 226),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                padding: EdgeInsets.all(0.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 238, 238, 238),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 120,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Image.asset(
                          "assets/logoGoogle.png",
                          height: 25,
                        ),
                      ),
                      Text(
                        'Google',
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
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                padding: EdgeInsets.all(10),
                width: 350,
                child: Text(
                  'Ao clicar em continuar, você concorda com nossos Termos de Serviço e Política de Privacidade',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 57, 135, 252),
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 9, 44, 131),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class TelaSignup2 extends StatefulWidget {
  const TelaSignup2({Key? key}) : super(key: key);

  @override
  _TelaSignup2State createState() => _TelaSignup2State();
}

class _TelaSignup2State extends State<TelaSignup2> {
  var dateInputController = MaskedTextController(mask: '00/00/0000');
  final phoneController = MaskedTextController(mask: '(00) 00000-0000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              width: double.infinity,
              height: 100,
              color: Colors.white,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, top: 50),
                      child: Text(
                        'E-Post',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Color.fromARGB(255, 11, 28, 172),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: EdgeInsets.only(right: 16.0, top: 50),
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
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Finalize seu cadastro",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 11, 28, 172),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Preencha com seu nome e data de nascimento",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 11, 28, 172),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Nome completo.",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 6, 43, 253),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome completo',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 83, 131, 255),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Data de nascimento.",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 6, 43, 253),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: dateInputController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 16,
                      ),
                      labelText: 'DD/MM/AAAA',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 83, 131, 255),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Número de telefone.",
                        style:
                            TextStyle(color: Color.fromARGB(255, 6, 43, 253)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "(00) 00000-0000",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 83, 131, 255),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 6, 45, 253),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 100,
                      ),
                    ),
                    child: Text(
                      'Finalizar',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    padding: EdgeInsets.all(10),
                    width: 350,
                    child: Text(
                      'Ao clicar em continuar, você concorda com nossos Termos de Serviço e Política de Privacidade',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Color.fromARGB(255, 57, 135, 252)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dateInputController.text =
            "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year.toString()}";
      });
    }
  }
}

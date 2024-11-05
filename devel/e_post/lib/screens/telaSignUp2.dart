import 'package:e_post/Screens/functionsScreens/savedata.dart';
import 'package:e_post/Screens/home.dart';
import 'package:e_post/screens/telaSignup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import '../database/db_helper.dart';

class TelaSignup2 extends StatefulWidget {
  const TelaSignup2({super.key});

  @override
  _TelaSignup2State createState() => _TelaSignup2State();
}

class _TelaSignup2State extends State<TelaSignup2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController completeName = TextEditingController();
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
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              width: double.infinity,
              height: 100,
              color: Colors.white,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Padding(
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
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0, top: 50),
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
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Finalize seu cadastro",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: const Color.fromARGB(255, 11, 28, 172),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Preencha com seu nome e data de nascimento",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 11, 28, 172),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Align(
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
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: completeName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Este campo é obrigatório';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Nome completo',
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 83, 131, 255),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Align(
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
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: dateInputController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13)),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 16,
                              ),
                              labelText: 'DD/MM/AAAA',
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 83, 131, 255),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_today),
                                onPressed: () => _selectDate(context),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, preencha com uma data';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                "Número de telefone (opcional)",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 6, 43, 253)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "(00) 00000-0000",
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 83, 131, 255),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 16,
                              ),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 6, 45, 253),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 100,
                      ),
                    ),
                    child: const Text(
                      'Finalizar',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String dataformatada;
                        List<String> datas = [];
                        datas.addAll(dateInputController.text.split('/'));
                        dataformatada =
                            '${datas[2]}-${datas[1]}-${datas[0]}';

                        dados["name"] = completeName.text;
                        dados["data_nascimento"] = dataformatada;
                        dados["telefone"] = (phoneController.text.isNotEmpty)
                            ? phoneController.text
                            : null;
                        await submitForm();
                        dados.clear;

                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.white,
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    padding: const EdgeInsets.all(10),
                    width: 350,
                    child: const Text(
                      'Ao clicar em finalizar, você concorda com nossos Termos de Serviço e Política de Privacidade',
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

import 'package:e_post/Screens/functionsScreens/seletor_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:google_fonts/google_fonts.dart';

class CriaCampeonatosPage extends StatefulWidget {
  const CriaCampeonatosPage({super.key});

  @override
  State<CriaCampeonatosPage> createState() => _CriaCampeonatosPageState();
}

class _CriaCampeonatosPageState extends State<CriaCampeonatosPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController completeName = TextEditingController();
  var dateInputController = MaskedTextController(mask: '00/00/0000');

  void atualizarPagina() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "E-Post",
              style: TextStyle(color: Color.fromARGB(255, 6, 43, 253)),
            ),
            SizedBox(
              width: 3,
            ),
            Image.asset(
              "assets/images/icone.png",
              width: 50,
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Crie o campeonato",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color.fromARGB(255, 6, 43, 253)),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Nome do campeonato.',
                      labelStyle: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 57, 135, 252)),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Horário do campeonato.',
                      labelStyle: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 57, 135, 252)),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.location_on_outlined)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Localização',
                      labelStyle: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 57, 135, 252)),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: dateInputController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => selectDate(
                            context, dateInputController, atualizarPagina),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'DD/MM/AAAA',
                      labelStyle: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 57, 135, 252)),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, preencha com uma data';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                )
              ],
            )),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "Ao continuar você concorda ser o único responsável pela localização e horário mencionados",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 6, 43, 253)),
                      ),
                    ),
                    Icon(Icons.check_box_outline_blank)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 50,
              width: double.infinity,
              child: CupertinoButton(
                  color: Color.fromARGB(255, 6, 43, 253),
                  child: Text(
                    "Criar campeonato",
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {}),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
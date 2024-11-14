import 'package:e_post/Screens/functionsScreens/jogos/telaAdicionarTimes.dart';
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
  List<String> items = [
    "Selecione a modalidade",
    "Futebol",
    "Futsal",
    "Handball",
    "Basketball",
    "Volleyball",
    "Outros"
  ];
  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController completeName = TextEditingController();
  var dateInputController = MaskedTextController(mask: '00/00/0000');
  bool temTime = false;
  List<String> times = [];

  void atualizarPagina() {
    setState(() {});
  }

  void adicionartime(String time) {
    times.add(time);
  }

  @override
  void initState() {
    super.initState();
    selectedValue = items.isNotEmpty ? items[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          color: Colors.white,
          padding: EdgeInsets.only(left: 30, right: 30),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
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
                            vertical: 14,
                            horizontal: 15,
                          )),
                    ),
                    SizedBox(
                      height: 8,
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
                            vertical: 14,
                            horizontal: 15,
                          )),
                    ),
                    SizedBox(
                      height: 8,
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
                            vertical: 14,
                            horizontal: 15,
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, preencha com uma data';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 8,
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
                            vertical: 14,
                            horizontal: 15,
                          )),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 15),
                        height: 50,
                        alignment: Alignment.centerLeft,
                        width: double.infinity - 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: Colors.grey.shade600)),
                        child: DropdownButton<String>(
                          style: TextStyle(fontSize: 50),
                          value: selectedValue,
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 57, 135, 252),
                                ),
                              ),
                            );
                          }).toList(),
                          underline: SizedBox.shrink(),
                          icon:
                              Icon(Icons.arrow_drop_down, color: Colors.black),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: CupertinoButton(
                          color: Color.fromARGB(255, 6, 43, 253),
                          child: Text(
                            "Adicionar times",
                            style: GoogleFonts.inter(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {
                            menuTimes(context, times, adicionartime);
                          }),
                    ),
                  ],
                )),
                SizedBox(
                  height: 5,
                ),
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
                            "Ao continuar você confirma ser o único responsável pela localização e horário mencionados",
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
          )),
    );
  }
}

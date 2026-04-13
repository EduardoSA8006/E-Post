import 'package:e_post/Screens/functionsScreens/notificacoes/gera_notificacoes.dart';
import 'package:e_post/Screens/functionsScreens/notificacoes/menu.dart';
import 'package:flutter/material.dart';

class NotoficationPage extends StatefulWidget {
  const NotoficationPage({super.key});

  @override
  State<NotoficationPage> createState() => _NotoficationPageState();
}

class _NotoficationPageState extends State<NotoficationPage> {
  bool semNotificacoes = notificacoes.isEmpty;

  void atualizarPagina() {
    setState(() {
      if (notificacoesSelecionadas.length == notificacoes.length &&
          selecionandoTodos == false) {
        selecionandoTodos = true;
      }

      if (notificacoesSelecionadas.isEmpty && permitirSelecao == false) {
        selecionando = false;
      }
      if (notificacoes.isEmpty) {
        semNotificacoes = true;
      } else {
        semNotificacoes = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: Text('Notificações'),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 2),
                child: menuzinho(context, atualizarPagina),
              )
            ],
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(16),
          child: semNotificacoes
              ? Transform.translate(
                  offset: Offset(0, -30),
                  child: Center(
                    child: Text(
                      'Nenhuma notificação',
                      textAlign: TextAlign.center,
                    ),
                  ))
              : Column(
                  children: [
                    selecionando
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 13, right: 20),
                                child: InkWell(
                                  child: Row(
                                    children: [
                                      Icon(
                                        selecionandoTodos
                                            ? Icons.check_box_rounded
                                            : Icons
                                                .check_box_outline_blank_rounded,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        "Selecionar todas",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    selecionandoTodos = !selecionandoTodos;
                                    selecionandoTodos
                                        ? null
                                        : notificacoesSelecionadas.clear();

                                    atualizarPagina();
                                    permitirSelecao = false;
                                  },
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    deletarNotificacoesSelecionadas();
                                    selecionandoTodos = false;
                                    atualizarPagina();
                                  },
                                  icon: Icon(Icons.delete)),
                            ],
                          )
                        : SizedBox(
                            height: 10,
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: NotificationWidget(
                          atualizarPagina: atualizarPagina,
                        ),
                      ),
                    )
                  ],
                ),
        ));
  }
}

import 'package:e_post/screens/functionsScreens/notificacoes/gera_notificacoes.dart';
import 'package:flutter/material.dart';

Widget menuzinho(BuildContext context, Function atualizarPagina) {
  return PopupMenuButton<String>(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      onSelected: (String value) {
        if (value == "1") {
          if (permitirSelecao == false) {
            permitirSelecao = true;
            selecionando = true;
          } else {
            permitirSelecao = false;
            selecionando = false;
          }

          atualizarPagina();
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<String>(
            value: '1',
            child: Text(
              'Selecionar',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ),
          const PopupMenuItem<String>(
            value: '2',
            child: Text(
              'Apagar todas',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          ),
          const PopupMenuItem<String>(
            value: '3',
            child: Text(
              'Marcar todas como lida',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
          )
        ];
      });
}

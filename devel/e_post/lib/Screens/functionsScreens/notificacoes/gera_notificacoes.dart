import 'package:e_post/Screens/home.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> notificacoes = [
  {"id": 1, "title": "Notificação 1", "description": "Esta é a notificação 1"},
  {"id": 2, "title": "Notificação 2", "description": "Esta é a notificação 2"},
  {"id": 3, "title": "Notificação 3", "description": "Esta é a notificação 3"},
];

bool selecionando = false;
bool permitirSelecao = false;
Set<int> notificacoesSelecionadas = <int>{};
Set<int> notificacoesLidas = <int>{};
bool selecionandoTodos = false;

void adicionaSelecao(int a) {
  if (!notificacoesSelecionadas.contains(a)) {
    notificacoesSelecionadas.add(a);
  }
}

void deletarNotificacoesSelecionadas() {
  notificacoes.removeWhere(
      (notification) => notificacoesSelecionadas.contains(notification['id']));

  notificacoesSelecionadas.clear();
}

class NotificationWidget extends StatelessWidget {
  final Function atualizarPagina;

  const NotificationWidget({super.key, 
    required this.atualizarPagina,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notificacoes.length,
      itemBuilder: (context, index) {
        final notification = notificacoes[index];
        bool lida = notificacoesLidas.contains(notification["id"]);

        bool isSelected = notificacoesSelecionadas.contains(notification['id']);
        if (selecionandoTodos) {
          isSelected = true;
          adicionaSelecao(notification["id"]);
        }
        return ListTile(
          
          leading: Container(
            width: 5,
            color: (lida ? Colors.purple[200] : Colors.purple[800]),
          ),
          tileColor: isSelected ? Colors.grey[350] : null,
          title: Transform.translate(
            offset: Offset(-12, 0),
            child: Text(
              notification['title'],
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: lida ? FontWeight.normal : FontWeight.w600),
            ),
          ),
          subtitle: Transform.translate(
            offset: Offset(-12, 0),
            child: Text(
              notification['description'],
              style: TextStyle(fontSize: 15),
            ),
          ),
          trailing: selecionando
              ? Transform.translate(
                  offset: Offset(7, 0),
                  child: Icon(isSelected
                      ? Icons.check_box_sharp
                      : Icons.check_box_outline_blank_outlined))
              : Transform.translate(
                  offset: Offset(20, 0),
                  child: IconButton(
                    icon: Icon(Icons.menu_outlined),
                    onPressed: () {
                      _MostrarNotificationsOptions(context, notification);
                    },
                  ),
                ),
          onTap: () {
            permitirSelecao = false;
            selecionandoTodos = false;
            if (selecionando) {
              isSelected = !isSelected;
              isSelected
                  ? adicionaSelecao(notification["id"])
                  : notificacoesSelecionadas.remove(notification["id"]);
            } else {
              notificacoesLidas.add(notification["id"]);
              lida = true;
            }
            atualizarPagina();
          },
          onLongPress: () {
            if (selecionando) {
              isSelected = !isSelected;
            } else {
              selecionando = true;
              adicionaSelecao(notification["id"]);
            }

            atualizarPagina();
          },
        );
      },
    );
  }

  void _MostrarNotificationsOptions(
      BuildContext context, Map<String, dynamic> notification) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.info),
                title: Text('Ver Detalhes'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Deletar'),
                onTap: () {
                  notificacoes.remove(notification);
                  notificacoesSelecionadas.remove(notification['id']);
                  atualizarPagina();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

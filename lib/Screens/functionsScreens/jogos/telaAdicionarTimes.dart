import 'package:e_post/Screens/functionsScreens/jogos/geraWidgetsTimes.dart';
import 'package:flutter/material.dart';

Future menuTimes(context, times, adicionartime) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController inputController = TextEditingController();
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            height: 375,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text("Times"),
                Stack(alignment: Alignment(0, -1.14), children: [
                  Container(
                    alignment: Alignment.center,
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [...timesFunction(times)],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              editando ? editando = false : editando = true;
                              Navigator.pop(context);
                              menuTimes(context, times, adicionartime);
                            },
                            icon: Icon(Icons.delete)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                      ],
                    ),
                  )
                ]),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                  child: TextFormField(
                    controller: inputController,
                    decoration: InputDecoration(
                      hintText: "Nome do time",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (inputController.text.isNotEmpty) {
                        adicionartime(inputController.text);
                        Navigator.pop(context);
                        menuTimes(context, times, adicionartime);
                      }
                    },
                    child: const Text("Adicionar")),
              ],
            ),
          ),
        );
      });
}

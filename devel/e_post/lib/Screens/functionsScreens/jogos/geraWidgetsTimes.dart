import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool editando = false;

List<Widget> timesFunction(times) {
  List<Widget> timesList = [];
  if (times.isNotEmpty) {
    for (String t in times) {
      timesList.add(
        editando
            ? Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                  TextButton(
                    child: Text(
                      t,
                      style: GoogleFonts.inter(fontSize: 18),
                    ),
                    onPressed: () {
                      print(9);
                    },
                  )
                ],
              )
            : Text(
                t,
                style: GoogleFonts.inter(fontSize: 18),
              ),
      );
    }
  }
  return timesList;
}

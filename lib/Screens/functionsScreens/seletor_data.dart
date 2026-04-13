import 'package:flutter/material.dart';

void selectDate(
    BuildContext context, dateInputController, atualizarPagina) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );
  if (picked != null) {
    dateInputController.text =
        "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year.toString()}";
    atualizarPagina();
  }
}

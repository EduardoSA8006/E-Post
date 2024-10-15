verificaForcaSenha(String? value) {
  int pontos = 0;
  if (value == null || value.isEmpty) {
  } else {
    if (value.length >= 8) pontos += 1;
    if (value.length >= 12) pontos += 1;
    if (value.contains(RegExp(r'[A-Z]'))) pontos += 1;
    if (value.contains(RegExp(r'[0-9]'))) pontos += 1;
    if (value.contains(RegExp(r'[!@#\$&*~]'))) pontos += 1;

    return pontos;
  }
}

String? validarSenha(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, insira uma senha';
  }
  if (value.length < 6) {
    print(value);
    return 'A senha deve ter no mínimo 6 caracteres';
  }
  if (verificaForcaSenha(value) <= 2) {
    return "A senha deve ser uma combinação de letras, números e caracteres";
  }
  return null;
}

String? verificaConfirmeSenha(String? value, String? senha) {
  if (value == null || value.isEmpty) {
    return 'Por favor, confirme a senha';
  }
  if (value != senha) {
    return 'As senhas não são iguais';
  }
  return null;
}

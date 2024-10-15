String? validarEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, insira um e-mail';
  }
  String emailRegExp = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp email = RegExp(emailRegExp);
  if (!email.hasMatch(value)) {
    return 'Por favor, insira um e-mail válido';
  }
  return null;
}

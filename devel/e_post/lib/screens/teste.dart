import 'package:flutter/material.dart';

class VerificaSenha extends StatefulWidget {
  @override
  _VerificaSenhaState createState() => _VerificaSenhaState();
}

class _VerificaSenhaState extends State<VerificaSenha> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmaSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verificar Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _senhaController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Crie uma senha'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma senha';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmaSenhaController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirme a senha'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, confirme a senha';
                  }
                  if (value != _senhaController.text) {
                    return 'As senhas não são iguais';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Se o formulário for válido, mostre uma mensagem de sucesso
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Senha validada com sucesso!')),
                    );
                  }
                },
                child: Text('Verificar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NotoficationPage extends StatefulWidget {
  const NotoficationPage({super.key});

  @override
  State<NotoficationPage> createState() => _NotoficationPageState();
}

class _NotoficationPageState extends State<NotoficationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificações'),
      ),
    );
  }
}

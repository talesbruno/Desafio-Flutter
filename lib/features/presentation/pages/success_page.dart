import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final String message;

  SuccessPage(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sucesso')),
      body: Center(
        child: Text(message, style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
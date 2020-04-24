import 'package:despesas_pessoais/src/screens/home_screen.dart';
import 'package:flutter/material.dart';

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MinhaPaginaInicial(),
      theme: ThemeData(),
    );
  }
}

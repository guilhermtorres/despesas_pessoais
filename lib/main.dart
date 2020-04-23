import 'package:flutter/material.dart';

main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MinhaPaginaInicial());
  }
}

class MinhaPaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Ponto de Partida'));
  }
}

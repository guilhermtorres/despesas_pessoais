import 'package:despesas_pessoais/models/transacoes.dart';
import 'package:flutter/material.dart';

main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MinhaPaginaInicial());
  }
}

class MinhaPaginaInicial extends StatelessWidget {
  final _transacoes = [
    Transacao(
      id: 't1',
      title: 'Novo tênis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transacao(
      id: 't2',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              color: Colors.blue,
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transacoes.map((tr) {
              return Card(
                child: Row(children: <Widget>[
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        tr.value.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      )),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                    Text(
                      tr.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(tr.date.toString(), style: TextStyle(color: Colors.grey)),
                  ])
                ]),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

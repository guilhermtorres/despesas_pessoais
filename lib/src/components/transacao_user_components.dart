import 'dart:math';

import 'package:despesas_pessoais/src/models/transacoes_model.dart';
import 'package:flutter/material.dart';
import 'transacao_components.dart';
import 'transacao_form_components.dart';

class TransacaoUsers extends StatefulWidget {
  @override
  _TransacaoUsersState createState() => _TransacaoUsersState();
}

class _TransacaoUsersState extends State<TransacaoUsers> {
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
  _addTransacao(String title, double value) {
    final novaTransacao = Transacao(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _transacoes.add(novaTransacao);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransacaoForm(_addTransacao),
        TransacaoList(_transacoes),
      ],
    );
  }
}

import 'package:despesas_pessoais/src/components/transacao_components.dart';
import 'package:despesas_pessoais/src/models/transacoes_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../components/transacao_form_components.dart';

class MinhaPaginaInicial extends StatefulWidget {
  @override
  _MinhaPaginaInicialState createState() => _MinhaPaginaInicialState();
}

class _MinhaPaginaInicialState extends State<MinhaPaginaInicial> {
  final List<Transacao> _transacoes = [
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
    Navigator.pop(context);
    setState(() {
      _transacoes.add(novaTransacao);
    });
  }

  _openTransacaoFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return TransacaoForm(_addTransacao);
        });
  }

  Widget chartWidget() => Container(
        child: Card(
          color: Theme.of(context).primaryColor,
          child: Text('Gráfico'),
          elevation: 5,
        ),
      );

  @override
  Widget build(BuildContext context) {
    print(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () => _openTransacaoFormModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            chartWidget(),
            TransacaoList(_transacoes),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _openTransacaoFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

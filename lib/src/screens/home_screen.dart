import 'dart:io';

import 'package:despesas_pessoais/src/components/transacao_components.dart';
import 'package:despesas_pessoais/src/models/transacoes_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../components/transacao_form_components.dart';
import '../components/grafico_components.dart';

class MinhaPaginaInicial extends StatefulWidget {
  @override
  _MinhaPaginaInicialState createState() => _MinhaPaginaInicialState();
}

class _MinhaPaginaInicialState extends State<MinhaPaginaInicial> {
  final List<Transacao> _transacoes = [];
  bool _showChart = false;

  List<Transacao> get _recentTransactions {
    return _transacoes.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransacao(String title, double value, DateTime date) {
    final novaTransacao = Transacao(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );
    Navigator.pop(context);
    setState(() {
      _transacoes.add(novaTransacao);
    });
  }

  _deleteTransactions(String id) {
    setState(() {
      _transacoes.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransacaoFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return TransacaoForm(_addTransacao);
        });
  }

  Widget chartWidget() => Grafico(_recentTransactions);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
          fontSize: 20 * mediaQuery.textScaleFactor,
        ),
      ),
      actions: <Widget>[
        if (isLandscape)
          IconButton(
            icon: Icon(
              _showChart ? Icons.list : Icons.insert_chart,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _showChart = !_showChart;
              });
            },
          ),
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => _openTransacaoFormModal(context),
        ),
      ],
    );
    final avaibleHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        MediaQuery.of(
          context,
        ).padding.top;
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (_showChart || !isLandscape)
                Container(
                  height: avaibleHeight * (isLandscape ? 0.8 : 0.3),
                  child: chartWidget(),
                ),
              if (!_showChart)
                Container(
                  height: avaibleHeight * (isLandscape ? 1 : 0.7),
                  child: TransacaoList(
                    _transacoes,
                    _deleteTransactions,
                  ),
                ),
            ],
          ),
        ),
        floatingActionButton: Platform.isIOS
            ? Container()
            : FloatingActionButton(
                child: Icon(
                  Icons.add,
                ),
                onPressed: () => _openTransacaoFormModal(context),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

import 'package:despesas_pessoais/src/components/transacao_user_components.dart';
import 'package:flutter/material.dart';

class MinhaPaginaInicial extends StatelessWidget {
  Widget chartWidget() => Container(
        child: Card(
          color: Colors.blue,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            chartWidget(),
            TransacaoUsers(),
          ],
        ),
      ),
    );
  }
}

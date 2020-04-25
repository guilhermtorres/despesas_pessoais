import 'package:despesas_pessoais/src/models/transacoes_model.dart';
import 'package:despesas_pessoais/src/utils/ConversaoData_utils.dart';
import 'package:flutter/material.dart';

class TransacaoList extends StatelessWidget {
  final List<Transacao> transacoes;
  final void Function(String) onRemove;

  TransacaoList(this.transacoes, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transacoes.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Ops! Nenhuma Transação Cadastrada!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transacoes.length,
              itemBuilder: (ctx, index) {
                final tr = transacoes[index];
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            'R\$ ${tr.value}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      ConversaoData().dateBrWithMonth(tr.date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => onRemove(tr.id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

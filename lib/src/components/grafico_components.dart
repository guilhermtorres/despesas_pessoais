import 'package:despesas_pessoais/src/components/grafico_barra_components.dart';
import 'package:despesas_pessoais/src/models/transacoes_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Grafico extends StatelessWidget {
  final List<Transacao> recentTransactions;

  Grafico(this.recentTransactions);

  List<Map<String, dynamic>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) totalSum += recentTransactions[i].value;
      }
      return {
        'day': DateFormat.E('pt_Br').format(weekDay)[0].toUpperCase(),
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + tr['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            List list = groupedTransactions.map((item) => item['value']).toList();

            list.sort((a, b) => a.compareTo(b));

            return Flexible(
              fit: FlexFit.tight,
              child: GraficoBarra(
                label: tr['day'],
                value: tr['value'],
                percentage: _weekTotalValue == 0 ? 0 : list.last == tr['value'] ? 1 : ((double.parse(tr['value'].toString())) / list.last),
                big: list.length == 0 ? false : list.last == tr['value'],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

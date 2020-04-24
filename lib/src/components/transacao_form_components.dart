import 'package:flutter/material.dart';

class TransacaoForm extends StatefulWidget {
  final void Function(String, double) onSubmit;
  TransacaoForm(this.onSubmit);

  @override
  _TransacaoFormState createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
            controller: valueController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: 'Valor (R\$)',
            ),
          ),
          FlatButton(
            child: Text('Nova Transação'),
            textColor: Theme.of(context).primaryColor,
            onPressed: _submitForm,
          ),
        ]),
      ),
    );
  }
}

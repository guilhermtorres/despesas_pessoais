import 'package:despesas_pessoais/src/screens/home_screen.dart';
import 'package:flutter/material.dart';

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MinhaPaginaInicial(),
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.orange[300],
          fontFamily: 'OpenSans',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                button: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
        ));
  }
}

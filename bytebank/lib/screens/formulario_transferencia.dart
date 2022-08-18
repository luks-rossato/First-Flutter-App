
import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../models/transferencia.dart';


class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferência'),
          //backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                  controlador: _controladorCampoNumeroConta,
                  rotulo: 'Numero da Conta',
                  dica: '000'),
              Editor(
                  controlador: _controladorCampoValor,
                  rotulo: 'Valor da Transferência',
                  dica: '0.00',
                  icone: Icons.monetization_on),
              ElevatedButton(
                  onPressed: () {
                    _criaTransferencia(context);
                  },
                  child: Text('Confirmar'))
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroconta = int.parse(_controladorCampoNumeroConta.text);
    final double valor = double.parse(_controladorCampoValor.text);
    if (numeroconta != Null && valor != Null) {
      final transferenciaCriada = Transferencia(valor, numeroconta);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Transferência de $valor reais '
              'para a conta $numeroconta!')));
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferência'),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: Column(
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

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  Editor(
      {required this.controlador,
      required this.rotulo,
      required this.dica,
      this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          hintText: dica,
          labelText: rotulo,
          fillColor: Colors.deepPurple,
        ),
        keyboardType: TextInputType.number,
        cursorColor: Colors.deepPurple,
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 123456)),
          ItemTransferencia(Transferencia(200.0, 123456)),
          ItemTransferencia(Transferencia(300.0, 123456)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        splashColor: Colors.grey,
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida));
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.tipoConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int tipoConta;

  Transferencia(this.valor, this.tipoConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, tipoConta: $tipoConta}';
  }
}

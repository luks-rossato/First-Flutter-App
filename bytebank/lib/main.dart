import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controladorCampoNumeroConta,
                style: TextStyle(),
                decoration: InputDecoration(
                  hintText: '0000-0',
                  helperText: 'Digite aqui o numero da sua conta',
                  labelText: 'Numero da conta',
                  fillColor: Colors.deepPurple,
                ),
                keyboardType: TextInputType.number,
                cursorColor: Colors.deepPurple,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controladorCampoValor,
                decoration: InputDecoration(
                    hintText: '0.00',
                    labelText: 'Valor da Transferência',
                    icon: Icon(
                      Icons.monetization_on,
                      color: Colors.deepPurple,
                    )),
                keyboardType: TextInputType.number,
                cursorColor: Colors.deepPurple,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print('Clicou no Confirmar');
                  final int numeroconta =
                      int.parse(_controladorCampoNumeroConta.text);
                  final double valor =
                      double.parse(_controladorCampoValor.text);
                  if (numeroconta != Null && valor != Null) {
                    final transferenciaCriada =
                        Transferencia(valor, numeroconta);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Transferência de $valor reais '
                            'para a conta $numeroconta!')));
                  }
                },
                child: Text('Confirmar'))
          ],
        ));
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
        onPressed: () {},
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

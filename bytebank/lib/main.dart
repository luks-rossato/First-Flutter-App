// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: ListaTransferencia(),
        appBar: AppBar(
          title: Text('Transferências'),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          splashColor: Colors.grey,
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    ));

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(100.0, 'Conta Poupança')),
        ItemTransferencia(Transferencia(200.0, 'Conta Poupança')),
        ItemTransferencia(Transferencia(300.0, 'Conta Poupança')),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget{

  final Transferencia _transferencia;


  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
  final String tipoConta;

  Transferencia(this.valor, this.tipoConta);
}
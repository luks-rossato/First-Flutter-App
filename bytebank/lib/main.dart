// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('R\$ 100,00'),
                subtitle: Text('Conta poupança'),
              ),  
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('R\$ 200,00'),
                subtitle: Text('Conta poupança'),
              ),
            ),
          ],
        ),
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


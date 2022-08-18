
import 'package:flutter/material.dart';

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
          //fillColor: Colors.deepPurple,
        ),
        keyboardType: TextInputType.number,
        //cursorColor: Colors.deepPurple,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final String resposta;
  final void Function() qndSelecionado;

  Resposta(this.resposta, this.qndSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        //margin: EdgeInsets.all(10),
        child: ElevatedButton(
              child: Text(resposta),
              onPressed: qndSelecionado,
              style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.cyan),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                elevation: MaterialStateProperty.all(7.5),
              ),
            ),
        );
  }
}
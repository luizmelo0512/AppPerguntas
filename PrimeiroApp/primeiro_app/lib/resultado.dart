import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  int pontuacao = 0;

  final void Function() resetaApp;

  Resultado(this.pontuacao, this.resetaApp);

  String get fraseResultado{
    if (pontuacao < 10){
      return 'Membro Fraco';
    }else if (pontuacao < 15){
      return 'Membro Médio';
    }else if (pontuacao < 20){
      return 'Membro Bom';
    }else{
      return 'MONSTRO!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Center(
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              fraseResultado,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
        ),
        ElevatedButton(
          child: Text(
            'Reiniciar Aplicação',
            style: TextStyle(fontSize: 20),
            ),  
          onPressed: resetaApp,
          style: ButtonStyle(
              //elevation: MaterialStateProperty.all(50),
              //shadowColor: MaterialStateProperty.all(Colors.cyan),
              
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.black),
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
          )
        ),
     ]
  );
  }
}

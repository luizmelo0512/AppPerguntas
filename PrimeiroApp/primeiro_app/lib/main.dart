import 'package:flutter/material.dart';
import 'questionario.dart';
import 'resultado.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual a sua Cor favorita?',
      'resposta': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Verde', 'pontuacao': 5},
        {'texto': 'Vermelho', 'pontuacao': 3},
        {'texto': 'Preto', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual o seu Animal favorito?',
      'resposta': [
        {'texto': 'Gato', 'pontuacao': 6},
        {'texto': 'Cachorro', 'pontuacao': 9},
        {'texto': 'Cavalo', 'pontuacao': 4},
        {'texto': 'Pantera', 'pontuacao': 2},
      ],
    },
    {
      'texto': 'Qual o seu Carro Favorito?',
      'resposta': [
        {'texto': 'Marea 2.0 Turbo','pontuacao': 10 }, 
        {'texto': 'Opala 6cc', 'pontuacao': 5 },
        {'texto': 'Gol 1.6 AP', 'pontuacao': 8 },
        {'texto': 'Polo 1.0','pontuacao': 1 },
        ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada){
        if(mounted){
          setState(() {
          _perguntaSelecionada++;
          _pontuacaoTotal += pontuacao; 
        });
        }
    }

    print('_pontuacaoTotal: $_pontuacaoTotal');
  }

  void _resertarApp(){
      if(mounted){
        setState(() {
          _perguntaSelecionada = 0;
          _pontuacaoTotal = 0;
        });
      }
    }
    

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
          elevation: 5,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _resertarApp), 
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

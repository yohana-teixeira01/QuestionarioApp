import 'package:flutter/material.dart';
import 'package:form_questionario/questionario.dart';
import 'package:form_questionario/resultado.dart';

void main() {
  runApp(QuestionarioApp());
}

class QuestionarioApp extends StatefulWidget {

  @override
  State<QuestionarioApp> createState() => _QuestionarioAppState();

}

class _QuestionarioAppState extends State<QuestionarioApp> {
  var _perguntaSelecionada =0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
    'texto':  'Qual é a sua cor favorita?',
    'respostas': [
      {'texto':'Azul','pontuacao': 5 },
      {'texto':'Rosa','pontuacao': 4}, 
      {'texto':'Vinho','pontuacao': 3 }, 
      {'texto':'Preto','pontuacao': 2 },
     ],
    },
    {
    'texto':  'Qual é o seu animal favorito?',
    'respostas': [
      {'texto':'Cachorro', 'pontuacao': 5},
      {'texto':'Gato','pontuacao': 4}, 
      {'texto':'Tartaruga','pontuacao': 3},
       {'texto':'Borboleta','pontuacao': 2},
       ],
    },
    {
    'texto':  'Qual é a sua área de atuação favorita?',
    'respostas': [
      {'texto':'Mobile', 'pontuacao': 5},
      {'texto':'Front end','pontuacao': 4}, 
      {'texto':'Design','pontuacao': 3},
       {'texto':'Back end','pontuacao': 2},
    ],
    },
  ];
  
bool get temPerguntaSelecionada{
  return _perguntaSelecionada < _perguntas.length;
 }

 void _responder(int pontuacao){
    if(temPerguntaSelecionada){
      setState(() {
       _perguntaSelecionada++;
       _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada =0;
      _pontuacaoTotal = 0;
    });
  }

 

  @override
  Widget build(BuildContext context) {
    
   

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar:  AppBar(
          title: Center(child: const Text('Questionário')),
          backgroundColor: Colors.blueAccent,
        ),
        body:temPerguntaSelecionada 
        ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada, quandoResponder: _responder,
              ),
            ),
          ],
        ) 
        : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}


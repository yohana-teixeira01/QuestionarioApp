import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciandoQuestionario;
  Resultado(this.pontuacao, this.reiniciandoQuestionario);

  String get fraseResultado{
    if(pontuacao < 7){
      return 'Parabéns';
    }else if(pontuacao < 10){
      return 'você tem bons gostos';
    }else if (pontuacao < 13){
      return 'Tem ótimos gostos :)';
    }else{
      return 'Impressionada com seus gostos';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 28,
            ),
            ),
        ),
        TextButton(onPressed: reiniciandoQuestionario,
        child: Text(
          'Reiniciar',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        ),
      ],
    );
  }
}
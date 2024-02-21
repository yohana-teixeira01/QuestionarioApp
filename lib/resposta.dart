import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Resposta extends StatelessWidget {
 final String texto;
  final void Function() responder;

 Resposta(this.texto, this.responder );

  @override
  Widget build(BuildContext context) {
   return Container(
   width: double.infinity,
     child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: responder, 
              child: Text(texto),
            ),
   );
  }
}
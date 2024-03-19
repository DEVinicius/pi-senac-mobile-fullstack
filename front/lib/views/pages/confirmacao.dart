import 'package:flutter/material.dart';
import 'package:simplecut1/views/widget/botoes/botao.dart';
import 'package:simplecut1/views/widget/cores/cores.dart';


class Confirmacao extends StatelessWidget {

  const Confirmacao({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
        backgroundColor: corcinza(),
           body: Padding(
             padding: const EdgeInsets.all(40),
             child: Column(
               children: [
                 Padding(padding: EdgeInsets.only(top: 50)),
                 botaoicon(),
                 Padding(padding: EdgeInsets.only(top: 50)),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     
                     Text("Mateus,", 
                       style: TextStyle(
                         fontSize: 37,
                         fontWeight: FontWeight.bold,
                         color: coramarelo())),
                     Text("Seu agendamento foi realizado com sucesso",
                        style: TextStyle(
                         fontSize: 36,
                         fontWeight: FontWeight.bold,
                         color: Colors.white),),
                     Padding(padding: EdgeInsets.only(top: 80)),
                         ],
                       ),
                       Botaohome(),
                    
               ],
             ),
           ),
           bottomNavigationBar: BottomAppBar(
        color: corcinza(),
        child: Center(
            child: Image.asset(
              "assets/logo.jpeg",
              width: 200,
              height: 50,
            ),
          ),
        
      ),
       );
  }
}
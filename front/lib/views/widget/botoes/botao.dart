import 'package:flutter/material.dart';
import 'package:simplecut1/views/widget/cores/cores.dart';
import 'package:simplecut1/views/pages/agendamento.dart';
import 'package:simplecut1/views/pages/confirmacao.dart';
import 'package:simplecut1/views/pages/homepage.dart';import 'package:http/http.dart' as http;
import 'dart:convert';


class BotaoAgendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Agendamento()),
            ),
      child: Ink(
        decoration: BoxDecoration(
          color: coramarelo(),
          borderRadius: BorderRadius.circular(10)
        ),
        width: 300,
        height: 50,
        
        child: Center(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15)),
              Icon(
                Icons.calendar_month,
                color: corcinza(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 75)),
              Text(
                'Agendar',
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:corcinza()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BotaoConfirmar extends StatelessWidget {
  final int? selectedSlot; // Declaração do parâmetro selectedSlot

  BotaoConfirmar({this.selectedSlot}); // Construtor que aceita o parâmetro selectedSlot

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // Verifique se um slot foi selecionado
        if (selectedSlot != null) {
          // Se sim, envie os dados para o banco com o POST
          var url = Uri.parse('http://192.168.0.5:3000/schedule');
          var corpoJson = jsonEncode({
            "slotId": selectedSlot,
            "userId": 1 // Suponho que você tenha o userId disponível aqui
          });

          var response = await http.post(
            url,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: corpoJson,
          );

          if (response.statusCode == 200) {
            // Se o POST for bem-sucedido, navegue para a tela de confirmação
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Confirmacao()),
            );
          } else {
            // Se houver um erro no POST, exiba uma mensagem de erro
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Erro ao confirmar agendamento: ${response.statusCode}'),
              ),
            );
          }
        } else {
          // Se nenhum slot foi selecionado, exiba uma mensagem de erro
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Nenhum slot selecionado.'),
            ),
          );
        }
      },
      child: Ink(
        decoration: BoxDecoration(
          color: coramarelo(),
          borderRadius: BorderRadius.circular(10),
          
        ),
        width: 300,
        height: 50,
        child: Center(
          child: Text(
            'Confirmar Agendamento',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: corcinza(),
            ),
          ),
        ),
      ),
    );
  }
}

        
        




        class botaodata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Agendamento()),
            ),
      child: Container(
        
        decoration: BoxDecoration(
          color: coramarelo(),
          borderRadius: BorderRadius.circular(50)
        ),
        width: 50,
        height: 50,
      child: Center(
              child: Icon(Icons.calendar_month, color: corcinza(), size: 35,), 
              ),
            ),
          );
        }
        }


        class botaoreceberdata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Confirmacao()),
            ),
      child: Container(
        decoration: BoxDecoration(
          color: coramarelo(),
          borderRadius: BorderRadius.circular(10)
        ),
        width: 300,
        height: 50,
      child: Center(
              child: Text('0',
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: corcinza()),
                ),
              ),
            ),
          );
        }
        }



        class Botaohome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            ),
      child: Ink(
        decoration: BoxDecoration(
          color: coramarelo(),
          borderRadius: BorderRadius.circular(10)
        ),
        width: 300,
        height: 50,
        
        child: Center(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15)),
              Icon(
                Icons.calendar_month,
                color: corcinza(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15)),
              Text(
                'Ir para Meus Agendamentos',
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:corcinza()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class botaoicon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: coramarelo(),
        borderRadius: BorderRadius.circular(50)
        ),
        width: 100,
        height: 100,
        child: Center(
          child: Icon(Icons.check, color: corcinza(), size: 70,),
          
        ),
    );
  }
}
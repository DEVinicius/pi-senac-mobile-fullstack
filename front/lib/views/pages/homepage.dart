import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:simplecut1/views/widget/botoes/botao.dart';
import 'package:simplecut1/views/widget/cores/cores.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<dynamic>> _futureagendamentos;
  DateTime? selectedDate;
  List<int> slots = [];

  @override
  void initState() {
    super.initState();
    _futureagendamentos = _fetchAgendamentos(); // Chamada para carregar os agendamentos ao iniciar a tela
  }

  Future<List<dynamic>> _fetchAgendamentos() async {
    final response = await http.get(Uri.parse('http://192.168.0.5:3000/schedule?userId=1'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)["appointment"];
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  int? extractMeusAgendamentos(List<dynamic> slotsagendamentos1) {
    return slotsagendamentos1[1]['id'];
  }

  String extractHourandDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String hour = dateTime.hour.toString().padLeft(2, '0'); // Formata a hora
    String minute = dateTime.minute.toString().padLeft(2, '0'); // Formata os minutos
    String dateyear = dateTime.year.toString();
    String dateday = dateTime.day.toString();
    String datemonth = dateTime.month.toString();

    return "$dateday/$datemonth/$dateyear - $hour:$minute h";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corcinza(),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Olá!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                        Text(
                          "mateus",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: coramarelo(),
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/mateus.png'),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70),
                ),
                BotaoAgendar(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                Text(
                  "Meus Agendamentos",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                FutureBuilder<List<dynamic>>(
                  future: _futureagendamentos,
                  builder: (context, snapshot) {
                    print(snapshot.data);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return Column(
                        children: snapshot.data!.map<Widget>((item) {
                          
                          return ElevatedButton(
                            onPressed: () {
                              // Adicione a lógica do onPressed conforme necessário
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  return Colors.white; // Defina a cor branca aqui
                                },
                                
                              ),
                            ),
                            child: Text(extractHourandDate(item['start']),style: TextStyle(color: Colors.black),),
                          );
                        }).toList(),
                      );
                    } else {
                      return Text('Sem dados dos slots');
                    }
                  },
                ),
              ],
            ),
            
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

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:simplecut1/views/widget/botoes/botao.dart';
import 'package:simplecut1/views/widget/calendar/calendar.dart';
import 'package:simplecut1/views/widget/cores/cores.dart';

class Agendamento extends StatefulWidget {
  const Agendamento({Key? key}) : super(key: key);

  @override
  State<Agendamento> createState() => _AgendamentoState();
}

class _AgendamentoState extends State<Agendamento> {
  DateTime? selectedDate;
  bool isAgendamentoSelected = false;
  bool isConfirmacaoSelected = false;
  List<int> slots = [];
  late Future<List<dynamic>> _futureData;
  int? selectedSlot; // Estado para rastrear o slot selecionado

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.0.5:3000/slot?professionalId=1'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {  
      throw Exception('Failed to load data');
    }
  }

  int? extractFirstSlot(List<dynamic> slotsData) {
    return slotsData[0]['id'];
  }

  String extractHourFromDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String hour = dateTime.hour.toString().padLeft(2, '0'); // Formata a hora
    String minute = dateTime.minute.toString().padLeft(2, '0'); // Formata os minutos

    return "$hour:$minute";
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
                          "Novo",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          "Agendamento",
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
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 130),
                ),
                Botaodataicon(
                  onDateSelected: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                    updateAgendamentoState();
                  },
                ),
                Padding(padding: EdgeInsets.only(top: 20),),
                FutureBuilder<List<dynamic>>(
                  future: _futureData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return Center(
                        child: Wrap(
                          spacing: 4.0,
                          runSpacing: 4.0,
                          children: snapshot.data!.map<Widget>((item) {
                            int slotId = item['id'];
                            return ElevatedButton(
                              onPressed: () {
                                // Atualize o estado do slot selecionado
                                setState(() {
                                  selectedSlot = slotId;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    // Define a cor do botão com base no slot selecionado
                                    if (states.contains(MaterialState.pressed)) {
                                      // Retorna a cor quando o botão é pressionado
                                      return Colors.green.withOpacity(0.5); // Altere a opacidade conforme necessário
                                    } else {
                                      // Retorna a cor normal do botão
                                      return selectedSlot == slotId ? Colors.green : Colors.white;
                                    }
                                  },
                                ),
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                                textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 12,color: Colors.black)),
                              ),
                              child: Text(extractHourFromDate(item['start']),style: TextStyle(
                              fontSize: 12,
                              color: Colors.black, // Defina a cor do texto aqui
                            ),),
                            );
                          }).toList(),
                        ),
                      );
                    } else {
                      return Text('Sem dados dos slots');
                    }
                  },
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            BotaoConfirmar(selectedSlot: selectedSlot,), // Corrigido
            
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

  void updateAgendamentoState() {
    setState(() {
      isConfirmacaoSelected = isAgendamentoSelected;
    });
  }
}

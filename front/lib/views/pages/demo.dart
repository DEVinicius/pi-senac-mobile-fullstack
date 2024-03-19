import 'package:flutter/material.dart';

class MinhaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Título da Página'),
      ),
      body: Center(
        child: Text('Conteúdo da Página'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue, // Cor de fundo da barra
        child: Container(
          height: 60, // Altura da barra
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // Ação ao pressionar o botão home
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Ação ao pressionar o botão de pesquisa
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Ação ao pressionar o botão de perfil
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
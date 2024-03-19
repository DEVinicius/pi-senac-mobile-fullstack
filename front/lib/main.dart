import 'package:flutter/material.dart';
import 'package:simplecut1/views/pages/homepage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Certifica-se de que o Flutter está inicializado
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:  Homepage()
    );
  }
}



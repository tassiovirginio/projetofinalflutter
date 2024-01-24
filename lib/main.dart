import 'package:flutter/material.dart';
import 'package:projetofinalflutter/screens/my_home_screen.dart';
import 'package:projetofinalflutter/screens/checkin.dart';
import 'package:projetofinalflutter/utils/utils.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sabores do Mundo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: color_background),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 232, 231, 229),
          title: Text('Restaurante Sabores do Mundo', style: TextStyle (fontWeight: FontWeight.bold, fontSize: 22)),
          elevation: 70,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
          centerTitle: true,
        ),
      ),
    );
  }
}

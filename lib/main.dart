import 'package:flutter/material.dart';
import 'package:projetofinalflutter/screens/my_home_screen.dart';
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
      home: const MyHomePage(title: 'Sabores do Mundo'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projetofinalflutter/database/database.dart';
import 'package:projetofinalflutter/screens/login_screen.dart';
import 'package:projetofinalflutter/utils/utils.dart';
import 'package:projetofinalflutter/routes/routes.dart';

void main() async {
  await DataBase.carregarSheet();
  runApp(const MyApp());
}

var title = 'Restaurante Sabores do Mundo';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: color_background),
        useMaterial3: true,
      ),
      home: LoginScreen(title: title),
      routes: myroutes,
    );
  }
}

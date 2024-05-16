import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:projetofinalflutter/database/database.dart';
import 'package:projetofinalflutter/screens/login_screen.dart';
import 'package:projetofinalflutter/utils/utils.dart';

void main() async {
  await DataBase.carregarSheet();
  runApp(const GetMaterialApp(home: MyApp()));
}

var title = 'Restaurante Sabores do Mundo';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: colorBackground),
          useMaterial3: true,
        ),
        home: LoginScreen(title: title),
      );
}

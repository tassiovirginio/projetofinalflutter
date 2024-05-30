import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:projetofinalflutter/atomic/atomos/login_text_field.dart';
import 'package:projetofinalflutter/atomic/atomos/senha_text_field.dart';
import 'package:projetofinalflutter/atomic/moleculas/login.dart';
import 'dart:convert';
import 'package:projetofinalflutter/components/authentication_imput_decoration.dart';
import 'package:projetofinalflutter/database/database.dart';
import 'package:projetofinalflutter/screens/menu_screen.dart';
import 'package:projetofinalflutter/utils/utils.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});
  final String title;
  @override
  State<LoginScreen> createState() => LoginScreenState(title);
}

class LoginScreenState extends State<LoginScreen> {
  String title = "";
  LoginScreenState(this.title);

  static List<String> usuarioLogado = [];

  @override
  Widget build(BuildContext) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: colorBackground,
        appBar: AppBar(
          backgroundColor: colorBackground,
          title: Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          elevation: 90,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 30),
            Image.asset('lib/assets/logo.png', height: 170),
            const SizedBox(height: 40),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 38,
                  fontFamily: 'Times New Roman',
                  fontStyle: FontStyle.italic,
                  color: colorFont),
            ),
            const SizedBox(height: 40),
            LoginBox(
              title: title,
              loginTextField: LoginTextField(),
              senhaTextField: SenhaTextField(),
            )
          ],
        ),
      ),
    );
  }
}

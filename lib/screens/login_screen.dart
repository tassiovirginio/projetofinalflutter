import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projetofinalflutter/components/authentication_imput_decoration.dart';
import 'package:projetofinalflutter/database/database.dart';
import 'package:projetofinalflutter/screens/menu_screen.dart';
import 'package:projetofinalflutter/utils/utils.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => LoginScreenState(title);
}

class LoginScreenState extends State<LoginScreen> {
  var title;
  LoginScreenState(this.title);

  static List<String> usuarioLogado = [];

  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: color_background,
        appBar: AppBar(
          backgroundColor: color_background,
          title: Text(this.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          elevation: 90,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 30),
            Image.asset('lib/assets/logo.png', height: 150),
            SizedBox(height: 40),
            Text(
              this.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 38, fontFamily: 'Times New Roman', fontStyle: FontStyle.italic, color: color_font),
            ),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.all(10.0),
              width: 100,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: TextField(
                        controller: usuarioController,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                        decoration: getAuthenticationImputDecoration('Usuário'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: TextField(
                        controller: senhaController,
                        keyboardType: TextInputType.name,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                        decoration: getAuthenticationImputDecoration('Senha'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(100, 40, 100, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: color_button,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(9.0)),
                              )),
                          onPressed: () {
                            String usuario = usuarioController.text;
                            String senha = senhaController.text;
                            String senhaMD5 = md5.convert(utf8.encode(senha)).toString();
                            List<String> logado = DataBase.fazerLogin(usuario, senhaMD5);
                            if (logado.length != 0) {
                              usuarioLogado = logado;
                              Get.to(() => MenuScreen(title: title));
                            } else {
                              Get.snackbar("Erro", "Usuário ou senha inválidos");
                            }
                          },
                          child: const Text('Entrar', style: TextStyle(fontSize: 20, color: color_button_text))),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

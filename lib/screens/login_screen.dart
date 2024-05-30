import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:projetofinalflutter/atomic/atomos/login_text_field.dart';
import 'package:projetofinalflutter/atomic/atomos/senha_text_field.dart';
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

  var loginTextField = LoginTextField();
  var senhaTextField = SenhaTextField();

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
            Container(
              margin: const EdgeInsets.all(10.0),
              width: 100,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: loginTextField,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: senhaTextField,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(100, 40, 100, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: colorButton,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0)),
                              )),
                          onPressed: () {
                            String? usuario = loginTextField.controller?.text;
                            String? senha = senhaTextField.controller?.text;
                            String senhaMD5 =
                                md5.convert(utf8.encode(senha!)).toString();
                            List<String> logado =
                                DataBase.fazerLogin(usuario!, senhaMD5);
                            if (logado.isNotEmpty) {
                              usuarioLogado = logado;
                              Get.to(() => MenuScreen(title: title));
                            } else {
                              Get.snackbar(
                                  "Erro", "Usuário ou senha inválidos");
                            }
                          },
                          child: const Text('Entrar',
                              style: TextStyle(
                                  fontSize: 20, color: colorButtonText))),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

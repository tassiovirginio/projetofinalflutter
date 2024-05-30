import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:projetofinalflutter/atomic/atomos/botao_login.dart';
import 'package:projetofinalflutter/atomic/atomos/login_text_field.dart';
import 'package:projetofinalflutter/atomic/atomos/senha_text_field.dart';
import 'dart:convert';
import 'package:projetofinalflutter/database/database.dart';
import 'package:projetofinalflutter/screens/menu_screen.dart';

class LoginBox extends Container {
  var loginTextField = LoginTextField();
  var senhaTextField = SenhaTextField();

  static List<String> usuarioLogado = [];

  LoginBox(
      {super.key,
      required String title,
      required this.loginTextField,
      required this.senhaTextField})
      : super(
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
                  child: BotaoLogin(
                      () => realizarLogin(senhaTextField, loginTextField, title))),
            ],
          ),
        );
}

realizarLogin(var senhaTextField, var loginTextField, var title) {
  String senhaMD5 =
      md5.convert(utf8.encode(senhaTextField.controller!.text)).toString();
  List<String> logado =
      DataBase.fazerLogin(loginTextField.controller!.text, senhaMD5);
  if (logado.isNotEmpty) {
    LoginBox.usuarioLogado = logado;
    Get.to(() => MenuScreen(title: title));
  } else {
    Get.snackbar("Erro", "Usuário ou senha inválidos");
  }
}

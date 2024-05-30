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

class BotaoLogin extends ElevatedButton {
  BotaoLogin(var funcao)
      : super(
          style: ElevatedButton.styleFrom(
              backgroundColor: colorButton,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(9.0)),
              )),
          onPressed: funcao,
          child: const Text('Entrar',
              style:
                  TextStyle(fontSize: 20, color: colorButtonText)),
        );
}


/**
 * ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colorButton,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9.0)),
                        )),
                    onPressed: realizarLogin(senhaTextField, loginTextField, title),
                    child: const Text('Entrar',
                        style:
                            TextStyle(fontSize: 20, color: colorButtonText)))
 */
import 'package:flutter/material.dart';
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


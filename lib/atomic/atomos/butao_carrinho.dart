import 'package:flutter/material.dart';
import 'package:projetofinalflutter/utils/utils.dart';

class BotaoCarrinho extends ElevatedButton {
  BotaoCarrinho({VoidCallback? onPressed, super.key})
      : super(
          style: ElevatedButton.styleFrom(
              backgroundColor: colorButton,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(9.0)),
              )),
          onPressed: onPressed,
          child: const Text('Carrinho',
              style: TextStyle(fontSize: 20, color: Colors.white)),
        );
}

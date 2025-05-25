import 'package:flutter/material.dart';
import 'package:projetofinalflutter/utils/utils.dart';
import 'package:get/get.dart';

class BotaoVoltar extends ElevatedButton {
  BotaoVoltar({super.key})
      : super(
          style: ElevatedButton.styleFrom(
              backgroundColor: colorButton,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(9.0)),
              )),
          onPressed: () {
            Get.back();
          },
          child: const Text('Voltar',
              style: TextStyle(fontSize: 20, color: Colors.white)),
        );
}

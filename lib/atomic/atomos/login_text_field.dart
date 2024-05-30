import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:projetofinalflutter/components/authentication_imput_decoration.dart';
import 'package:projetofinalflutter/database/database.dart';
import 'package:projetofinalflutter/screens/menu_screen.dart';
import 'package:projetofinalflutter/utils/utils.dart';


class LoginTextField extends TextField {
  LoginTextField({super.key})
      : super(
        controller: TextEditingController(),
          keyboardType: TextInputType.name,
          style: const TextStyle(fontSize: 20, color: Colors.black),
          decoration: getAuthenticationImputDecoration('Usuário'),
        );
}

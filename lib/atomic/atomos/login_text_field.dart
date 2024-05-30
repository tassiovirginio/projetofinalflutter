import 'package:flutter/material.dart';
import 'package:projetofinalflutter/components/authentication_imput_decoration.dart';

class LoginTextField extends TextField {
  LoginTextField({super.key})
      : super(
        controller: TextEditingController(),
          keyboardType: TextInputType.name,
          style: const TextStyle(fontSize: 20, color: Colors.black),
          decoration: getAuthenticationImputDecoration('Usuário'),
        );
}

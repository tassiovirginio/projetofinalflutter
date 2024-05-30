import 'package:flutter/material.dart';
import 'package:projetofinalflutter/components/authentication_imput_decoration.dart';

class SenhaTextField extends TextField {

  SenhaTextField({super.key})
      : super(
        controller: TextEditingController(),
          keyboardType: TextInputType.name,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          style: const TextStyle(fontSize: 20, color: Colors.black),
          decoration: getAuthenticationImputDecoration('Senha'),
        );
}


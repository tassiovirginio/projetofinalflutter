import 'package:flutter/material.dart';

Widget createTextFormField(final String texto, bool obscureText) {
  return Container(
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: texto,
      ),
    ),
  );
}

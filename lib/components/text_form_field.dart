import 'package:flutter/material.dart';

Widget createTextFormField(final String texto, bool obscureText) {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: texto,
      ),
    ),
  );
}

import 'package:flutter/material.dart';

InputDecoration getAuthenticationImputDecoration(String hintLabel) {
  return InputDecoration(
    hintText: hintLabel,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
    fillColor: const Color.fromARGB(255, 201, 183, 183),
    filled: true,
    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
  );
}

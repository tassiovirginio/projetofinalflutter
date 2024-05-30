import 'package:flutter/material.dart';
import 'package:projetofinalflutter/utils/utils.dart';

class MeuAppBar extends AppBar {
  MeuAppBar(var title)
      : super(
          backgroundColor: colorBackground,
          title: Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          elevation: 90,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
          centerTitle: true,
        );
}


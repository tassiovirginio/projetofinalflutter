import 'package:flutter/material.dart';
import 'package:projetofinalflutter/atomic/atomos/login_text_field.dart';
import 'package:projetofinalflutter/atomic/atomos/meu_app_bar.dart';
import 'package:projetofinalflutter/atomic/atomos/senha_text_field.dart';
import 'package:projetofinalflutter/atomic/moleculas/login_box.dart';
import 'package:projetofinalflutter/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});
  final String title;
  @override
  State<LoginScreen> createState() => LoginScreenState(title);
}

class LoginScreenState extends State<LoginScreen> {
  String title = "";
  LoginScreenState(this.title);

  static List<String> usuarioLogado = [];

  @override
  Widget build(BuildContext) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: colorBackground,
        appBar: MeuAppBar(title),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 30),
            Image.asset('lib/assets/logo.png', height: 170),
            const SizedBox(height: 40),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 38,
                  fontFamily: 'Times New Roman',
                  fontStyle: FontStyle.italic,
                  color: colorFont),
            ),
            const SizedBox(height: 40),
            LoginBox(
              title: title,
              loginTextField: LoginTextField(),
              senhaTextField: SenhaTextField(),
            )
          ],
        ),
      ),
    );
  }
}

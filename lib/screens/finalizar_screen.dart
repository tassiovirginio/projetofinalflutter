import 'package:flutter/material.dart';
import 'package:projetofinalflutter/components/card_big.dart';
import 'package:projetofinalflutter/routes/routes.dart';
import 'package:projetofinalflutter/screens/confirmacao_screen.dart';
import 'package:projetofinalflutter/screens/login_screen.dart';
import 'package:projetofinalflutter/screens/menu_screen.dart';

class FinalizarScreen extends StatefulWidget {
  const FinalizarScreen({super.key, required this.title});

  final String title;

  @override
  State<FinalizarScreen> createState() => FinalizarScreenState(title);
}

class FinalizarScreenState extends State<FinalizarScreen> {
  FinalizarScreenState(this.title);
  var title;

  String nome = LoginScreenState.usuarioLogado[1];
  String numero = LoginScreenState.usuarioLogado[2];
  String endereco = LoginScreenState.usuarioLogado[3];

  double valorTotal = 0;

  @override
  Widget build(BuildContext) {
    valorTotal = 0;
    MenuScreenState.carrinho.forEach((item) {
      double valor = double.parse(item.valor);
      valorTotal += valor;
    });

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 185, 177, 155),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 232, 231, 229),
          title: Text(this.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          elevation: 70,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('lib/assets/logo.png', height: 100),
              ],
            ),
            Column(
              children: [
                Text(
                  "Pedido Feito com Sucesso",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontFamily: 'Times New Roman', fontWeight: FontWeight.bold),
                ),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cardBig(ConfirmacaoScreenState.pedido[1], ConfirmacaoScreenState.pedido[0], valorTotal.toString(),
                        Color.fromARGB(255, 164, 158, 141)),
                  ],
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(9.0)),
                          )),
                      onPressed: () {
                        MenuScreenState.carrinho = [];
                        ConfirmacaoScreenState.pedido = [];
                        Navigator.of(context).pushNamed(Routes.MENU.name);
                      },
                      child: Text('Novo Pedido', style: TextStyle(fontSize: 20, color: Colors.white))),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(9.0)),
                          )),
                      onPressed: () {
                        LoginScreenState.usuarioLogado = [];
                        MenuScreenState.carrinho = [];
                        ConfirmacaoScreenState.pedido = [];

                        Navigator.of(context).pushNamed(Routes.LOGIN.name);
                      },
                      child: Text('Sair', style: TextStyle(fontSize: 20, color: Colors.white))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

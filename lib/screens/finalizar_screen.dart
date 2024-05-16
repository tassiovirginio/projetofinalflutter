import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projetofinalflutter/components/card_big.dart';
import 'package:projetofinalflutter/models/carrinho.dart';
import 'package:projetofinalflutter/screens/confirmacao_screen.dart';
import 'package:projetofinalflutter/screens/login_screen.dart';
import 'package:projetofinalflutter/screens/menu_screen.dart';
import 'package:projetofinalflutter/utils/utils.dart';

class FinalizarScreen extends StatefulWidget {
  const FinalizarScreen({super.key, required this.title});

  final String title;

  @override
  State<FinalizarScreen> createState() => FinalizarScreenState(title);
}

class FinalizarScreenState extends State<FinalizarScreen> {
  var title;
  FinalizarScreenState(this.title);
  Carrinho carrinho = Get.find();

  String nome = LoginScreenState.usuarioLogado[1];
  String numero = LoginScreenState.usuarioLogado[2];
  String endereco = LoginScreenState.usuarioLogado[3];

  @override
  Widget build(BuildContext) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: colorBackground,
        appBar: AppBar(
          backgroundColor: colorBackground,
          title: Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          elevation: 70,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('lib/assets/logo.png', height: 130),
              ],
            ),
            SizedBox(height: 50),
            Column(
              children: [
                const Text(
                  "Pedido Feito com Sucesso",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cardBig(
                        cliente: ConfirmacaoScreenState.pedido[1],
                        pedido: ConfirmacaoScreenState.pedido[0],
                        total: carrinho.total.toString(),
                        color: const Color.fromARGB(255, 164, 158, 141)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorButton,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.0)),
                          )),
                      onPressed: () {
                        carrinho.lista = [];
                        ConfirmacaoScreenState.pedido = [];
                        Get.to(() => MenuScreen(title: title));
                      },
                      child: const Text('Novo Pedido',
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorButton,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.0)),
                          )),
                      onPressed: () {
                        LoginScreenState.usuarioLogado = [];
                        carrinho.lista = [];
                        ConfirmacaoScreenState.pedido = [];
                        Get.to(() => LoginScreen(title: title));
                      },
                      child: const Text('Sair',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

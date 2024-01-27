import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:projetofinalflutter/database/database.dart';
import 'package:projetofinalflutter/screens/finalizar_screen.dart';
import 'package:projetofinalflutter/screens/login_screen.dart';
import 'package:projetofinalflutter/screens/menu_screen.dart';
import 'package:projetofinalflutter/utils/utils.dart';

class ConfirmacaoScreen extends StatefulWidget {
  const ConfirmacaoScreen({super.key, required this.title});

  final String title;

  @override
  State<ConfirmacaoScreen> createState() => ConfirmacaoScreenState(title);
}

class ConfirmacaoScreenState extends State<ConfirmacaoScreen> {
  ConfirmacaoScreenState(this.title);
  var title;
  static var pedido = [];
  static double valorTotal = 0;

  @override
  Widget build(BuildContext) {
    List<List<String>>? listaProdutos = MenuScreenState.listaProdutos;

    Map<String, List<String>> mapaProdutos = {};

    listaProdutos?.forEach((element) {
      if (element[0] != "id") {
        mapaProdutos[element[0]] = element;
      }
    });

    print(mapaProdutos);

    List<Widget> listaCarrinhoWidget = [];

    valorTotal = 0;
    MenuScreenState.carrinho.forEach((item) {
      double valor = double.parse(item.valor);
      valorTotal += valor;
      listaCarrinhoWidget.add(itemMenu(
          item.name,
          item.descricao,
          item.valor,
          () => {
                setState(() {
                  MenuScreenState.carrinho.remove(item);
                })
              }));
    });

    Column colunacarrinho = Column(children: listaCarrinhoWidget);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: color_background,
        appBar: AppBar(
          backgroundColor: color_background,
          title: Text(this.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          elevation: 70,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
          centerTitle: true,
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Confirmação",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 38, fontFamily: 'Times New Roman', fontStyle: FontStyle.italic),
                    ),
                    Image.asset('lib/assets/logo.png', height: 80),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () => {},
                      child: Text(
                        "Itens no carrinho: " +
                            MenuScreenState.carrinho.length.toString() +
                            "      " +
                            "\nValor Total: " +
                            valorTotal.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(height: 20),
                colunacarrinho,
                SizedBox(height: 30),
                Container(
                    width: 400,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    alignment: Alignment.bottomCenter,
                    transformAlignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: color_button,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(9.0)),
                                )),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Voltar', style: TextStyle(fontSize: 20, color: Colors.white))),
                        SizedBox(width: 20),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: color_button,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(9.0)),
                                )),
                            onPressed: () async {
                              if (MenuScreenState.carrinho.length > 0) {
                                Get.to(() => ConfirmacaoScreen(title: title));

                                List<String> listaItensId = [];

                                MenuScreenState.carrinho.forEach((item) {
                                  listaItensId.add(item.name);
                                });

                                pedido = [
                                  "",
                                  LoginScreenState.usuarioLogado[1],
                                  LoginScreenState.usuarioLogado[2],
                                  LoginScreenState.usuarioLogado[3],
                                  listaItensId.toString(),
                                  valorTotal.toString()
                                ];
                                List<String> lsitaPedidos = await DataBase.realizarPedido(
                                    pedido[0], pedido[1], pedido[2], pedido[3], pedido[4], pedido[5]);

                                pedido = lsitaPedidos;
                                Get.to(() => FinalizarScreen(title: title));
                              } else {
                                Get.snackbar("Erro", "Carrinho vazio...");
                              }
                            },
                            child: Text('Confirmar', style: TextStyle(fontSize: 20, color: Colors.white))),
                      ],
                    )),
              ],
            )),
      ),
    );
  }
}

Widget itemMenu(String nome, String descricao, String preco, Function() funcao) {
  return Container(
    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
    width: 350,
    height: 100,
    child: Card(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      color: Colors.white,
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            nome,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontFamily: 'Times New Roman', fontWeight: FontWeight.bold),
          ),
          Text(
            "RS $preco",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontFamily: 'Times New Roman', fontWeight: FontWeight.bold),
          ),
          IconButton(onPressed: () => funcao(), icon: Icon(Icons.delete_sharp, size: 30))
        ]),
        Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
              width: 200,
              child: Text(
                descricao,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 12, fontFamily: 'Times New Roman', fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ]),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projetofinalflutter/database/database.dart';
import 'package:projetofinalflutter/models/carrinho.dart';
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

  @override
  Widget build(BuildContext) {
    Carrinho carrinho = Get.find();

    List<List<String>>? listaProdutos = MenuScreenState.listaProdutos;

    Map<String, List<String>> mapaProdutos = {};

    listaProdutos?.forEach((element) {
      if (element[0] != "id") {
        mapaProdutos[element[0]] = element;
      }
    });

    print(mapaProdutos);

    List<Widget> listaCarrinhoWidget = [];

    carrinho.lista.forEach((item) {
      listaCarrinhoWidget.add(itemMenu(
          item.name,
          item.descricao,
          item.valor,
          () => {
                setState(() {
                  carrinho.remove(item);
                })
              }));
    });

    Column colunacarrinho = Column(children: listaCarrinhoWidget);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: colorBackground,
        appBar: AppBar(
          backgroundColor: colorBackground,
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          elevation: 70,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Confirmação",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 38, fontFamily: 'Times New Roman', fontStyle: FontStyle.italic),
                  ),
                  Image.asset('lib/assets/logo.png', height: 80),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () => {
                          Get.snackbar(
                              "Carrinho", "Itens no carrinho: ${carrinho.length} \nValor Total: ${carrinho.total}")
                        },
                    child: Text(
                      "Itens no carrinho: ${carrinho.length} \nValor Total: ${carrinho.total}",
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(height: 20),
              colunacarrinho,
              const SizedBox(height: 30),
              Container(
                  width: 400,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  alignment: Alignment.bottomCenter,
                  transformAlignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: colorButton,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(9.0)),
                              )),
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Voltar', style: TextStyle(fontSize: 20, color: Colors.white))),
                      const SizedBox(width: 20),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: colorButton,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(9.0)),
                              )),
                          onPressed: () async {
                            if (carrinho.length > 0) {
                              Get.to(() => ConfirmacaoScreen(title: title));

                              List<String> listaItensId = [];

                              carrinho.lista.forEach((item) {
                                listaItensId.add(item.name);
                              });

                              pedido = [
                                "",
                                LoginScreenState.usuarioLogado[1],
                                LoginScreenState.usuarioLogado[2],
                                LoginScreenState.usuarioLogado[3],
                                listaItensId.toString(),
                                carrinho.total.toString()
                              ];
                              List<String> lsitaPedidos = await DataBase.realizarPedido(
                                  pedido[0], pedido[1], pedido[2], pedido[3], pedido[4], pedido[5]);

                              pedido = lsitaPedidos;
                              Get.to(() => FinalizarScreen(title: title));
                            } else {
                              Get.snackbar("Erro", "Carrinho vazio...");
                            }
                          },
                          child: const Text('Confirmar', style: TextStyle(fontSize: 20, color: Colors.white))),
                    ],
                  )),
            ],
          )),
        ),
      ),
    );
  }
}

Widget itemMenu(String nome, String descricao, String preco, Function() funcao) {
  return Container(
    margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
    width: 350,
    height: 100,
    child: Card(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      color: Colors.white,
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            nome,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontFamily: 'Times New Roman', fontWeight: FontWeight.bold),
          ),
          Text(
            "RS $preco",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontFamily: 'Times New Roman', fontWeight: FontWeight.bold),
          ),
          IconButton(onPressed: () => funcao(), icon: Icon(Icons.delete_sharp, size: 30))
        ]),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              width: 200,
              child: Text(
                descricao,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 12, fontFamily: 'Times New Roman', fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ]),
    ),
  );
}

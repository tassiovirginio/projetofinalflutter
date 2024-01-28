import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:projetofinalflutter/models/carrinho.dart';
import 'package:projetofinalflutter/models/item.dart';
import 'package:projetofinalflutter/database/database.dart';
import 'package:projetofinalflutter/screens/confirmacao_screen.dart';
import 'package:projetofinalflutter/utils/utils.dart';
// import 'package:get/get.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key, required this.title});

  final String title;

  @override
  State<MenuScreen> createState() => MenuScreenState(title);
}

class MenuScreenState extends State<MenuScreen> {
  MenuScreenState(this.title);
  var title;

  // static var carrinho = Carrinho().obs;

  static Carrinho carrinho = Carrinho();

  static List<List<String>>? listaProdutos;
  static int index = 0;

  @override
  Widget build(BuildContext context) {
    Get.put(carrinho);

    carrinho = Get.find();

    listaProdutos = DataBase.getProdutos();
    List<Widget> listaProdutosWidget = [];

    listaProdutos?.forEach((element) => {
          if (element[0] != "id")
            {
              listaProdutosWidget.add(itemMenu(
                  element[0],
                  element[1],
                  element[2],
                  element[3],
                  () => {
                        setState(() {
                          int id = int.parse(element[0]);
                          var item = Item(id: id, name: element[1], descricao: element[2], valor: element[3]);
                          carrinho.lista.add(item);
                          // carrinho.value.lista.add(item);
                          // carrinho.refresh();
                        })
                      }))
            },
        });

    Column columnProdutos = Column(
      children: listaProdutosWidget,
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: colorBackground,
        appBar: AppBar(
          backgroundColor: colorBackground,
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          elevation: 90,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(children: [
                      const SizedBox(width: 20),
                      const Text(
                        "Menu",
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 38, fontFamily: 'Times New Roman', fontStyle: FontStyle.italic),
                      ),
                    ]),
                    Column(
                      children: [
                        Image.asset('lib/assets/logo.png', height: 80),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () => {
                            Get.snackbar(
                                "Carrinho", "Itens no carrinho: ${carrinho.length} \nValor Total: ${carrinho.total}"),
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
                columnProdutos,
                const SizedBox(height: 15),
                const SizedBox(height: 15),
                Container(
                    margin: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            onPressed: () {
                              if (carrinho.lista.isNotEmpty) {
                                Get.to(() => ConfirmacaoScreen(title: title));
                              } else {
                                Get.snackbar("Erro", "Carrinho vazio...");
                              }
                            },
                            child: const Text('Carrinho', style: TextStyle(fontSize: 20, color: Colors.white))),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget itemMenu(String id, String nome, String descricao, String preco, Function() funcao) {
  return Container(
    margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
    width: 350,
    height: 110,
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
          IconButton(onPressed: funcao, icon: const Icon(Icons.add_shopping_cart, size: 30))
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
        ),
      ]),
    ),
  );
}

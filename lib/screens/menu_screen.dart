import 'package:flutter/material.dart';
import 'package:projetofinalflutter/models/item.dart';
import 'package:projetofinalflutter/routes/routes.dart';
import 'package:projetofinalflutter/database/database.dart';
import 'package:projetofinalflutter/utils/utils.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key, required this.title});

  final String title;

  @override
  State<MenuScreen> createState() => MenuScreenState(title);
}

class MenuScreenState extends State<MenuScreen> {
  MenuScreenState(this.title);
  var title;

  static List<Item> carrinho = [];
  static List<List<String>>? listaProdutos;
  static int index = 0;
  static double valorTotal = 0;

  @override
  Widget build(BuildContext context) {
    listaProdutos = DataBase.listaProdutos;
    List<Widget> listaProdutosWidget = [];

    valorTotal = 0;
    MenuScreenState.carrinho.forEach((item) {
      double valor = double.parse(item.valor);
      valorTotal += valor;
    });

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
                          MenuScreenState.carrinho.add(item);
                        })
                      }))
            },
        });

    Column columnProdutos = Column(
      children: listaProdutosWidget,
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: color_background,
        appBar: AppBar(
          backgroundColor: color_background,
          title: Text(this.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
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
                    Row(children: [
                      SizedBox(width: 20),
                      Text(
                        "Menu",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 38, fontFamily: 'Times New Roman', fontStyle: FontStyle.italic),
                      ),
                    ]),
                    Column(
                      children: [
                        Image.asset('lib/assets/logo.png', height: 80),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () => {print(valorTotal)},
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
                columnProdutos,
                SizedBox(height: 15),
                SizedBox(height: 15),
                Container(
                    margin: EdgeInsets.fromLTRB(50, 20, 50, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: color_button,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(9.0)),
                                )),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Voltar', style: TextStyle(fontSize: 20, color: Colors.white))),
                        SizedBox(width: 20),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: color_button,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(9.0)),
                                )),
                            onPressed: () {
                              if (carrinho.length > 0) {
                                Navigator.of(context).pushNamed(Routes.CONFIRMACAO.name);
                              } else {
                                _exibirDialogo();
                              }
                            },
                            child: Text('Carrinho', style: TextStyle(fontSize: 20, color: Colors.white))),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _exibirDialogo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: color_button,
          content: Text("Carrinho vazio...", style: TextStyle(fontSize: 20, color: Colors.white)),
        );
      },
    );
  }
}

Widget itemMenu(String id, String nome, String descricao, String preco, Function() funcao) {
  return Container(
    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
    width: 350,
    height: 110,
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
          IconButton(onPressed: funcao, icon: Icon(Icons.add_shopping_cart, size: 30))
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
        ),
      ]),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:projetofinalflutter/components/card_big.dart';
import 'package:projetofinalflutter/database/database.dart';
import 'package:projetofinalflutter/routes/routes.dart';
import 'package:projetofinalflutter/screens/login_screen.dart';
import 'package:projetofinalflutter/screens/menu_screen.dart';

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
                  // MenuScreenState.carrinho.removeWhere((i) => i == produto);
                  MenuScreenState.carrinho.remove(item);
                })
              }));
    });

    Column colunacarrinho = Column(children: listaCarrinhoWidget);

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
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () => {},
                      child: Text(
                        "Itens no carrinho: " +
                            MenuScreenState.carrinho.length.toString() +
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
                SizedBox(height: 20),
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
                                primary: Colors.green,
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
                                primary: Colors.green,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(9.0)),
                                )),
                            onPressed: () async {
                              pedido = [
                                "",
                                LoginScreenState.usuarioLogado[1],
                                LoginScreenState.usuarioLogado[2],
                                LoginScreenState.usuarioLogado[3],
                                MenuScreenState.carrinho.toString(),
                                "100"
                              ];
                              List<String> lsitaPedidos = await DataBase.realizarPedido(
                                  pedido[0], pedido[1], pedido[2], pedido[3], pedido[4], pedido[5]);

                              pedido = lsitaPedidos;
                              Navigator.of(context).pushNamed(Routes.FINALIZAR.name);
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
    width: 310,
    height: 100,
    child: Card(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      color: Colors.white,
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            nome,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontFamily: 'Times New Roman', fontWeight: FontWeight.bold),
          ),
          Text(
            preco,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontFamily: 'Times New Roman', fontWeight: FontWeight.bold),
          ),
          IconButton(onPressed: () => funcao(), icon: Icon(Icons.delete_sharp))
        ]),
        Row(
          children: [
            Container(
              width: 300,
              child: Text(
                descricao,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontFamily: 'Times New Roman', fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ]),
    ),
  );
}

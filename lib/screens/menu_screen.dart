import 'package:flutter/material.dart';
import 'package:projetofinalflutter/components/card_big.dart';
import 'package:projetofinalflutter/routes/routes.dart';
import 'package:projetofinalflutter/database/database.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key, required this.title});

  final String title;

  @override
  State<MenuScreen> createState() => MenuScreenState(title);
}

class MenuScreenState extends State<MenuScreen> {
  MenuScreenState(this.title);
  var title;

  @override
  Widget build(BuildContext) {
    List<List<String>>? listaProdutos = DataBase.listaProdutos;

    List<Widget> listaProdutosWidget = [];

    listaProdutos?.forEach((element) {
      listaProdutosWidget.add(itemMenu(element[1], element[2], element[3]));
    });

    Column columnProdutos = Column(
      children: listaProdutosWidget,
    );

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
              SizedBox(height: 20),
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () => {},
                    child: Text(
                      "Itens no carrinho: 12",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(height: 20),
              Text(
                "MENU",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontFamily: 'Times New Roman', fontWeight: FontWeight.bold),
              ),
              columnProdutos,
              // itemMenu("Coca-Cola", "Coca-Cola 2L", "R\$ 10,00"),
              // itemMenu("Suco", "Suco de laranja", "R\$ 5,00"),
              // itemMenu("X-Tudo", "Pão, carne, queijo, ovo, bacon, alface, tomate e maionese", "R\$ 20,00"),
              // itemMenu("Pizza", "Pizza de calabresa", "R\$ 30,00"),
              SizedBox(height: 20),
              Container(
                  width: 400,
                  margin: EdgeInsets.fromLTRB(100, 0, 100, 0),
                  child: Row(
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
                          onPressed: () {
                            Navigator.of(context).pushNamed(Routes.CONFIRMACAO.name);
                          },
                          child: Text('Carrinho', style: TextStyle(fontSize: 20, color: Colors.white))),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

Widget itemMenu(String nome, String descricao, String preco) {
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
          IconButton(onPressed: () => {}, icon: Icon(Icons.add_shopping_cart))
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

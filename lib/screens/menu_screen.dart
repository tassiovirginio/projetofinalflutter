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
  List<Widget> listaProdutosWidget = [];
  static List<String> carrinho = [];

  @override
  Widget build(BuildContext) {
    List<List<String>>? listaProdutos = DataBase.listaProdutos;

    listaProdutos?.forEach((element) => {
          if (element[0] != "id")
            listaProdutosWidget.add(itemMenu(
                element[0],
                element[1],
                element[2],
                element[3],
                () => {
                      setState(() {
                        MenuScreenState.carrinho.add(element[0]);
                      })
                    }))
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    IconButton(
                        onPressed: () => {},
                        icon: Icon(
                          Icons.list,
                          size: 50.0,
                        )),
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
              SizedBox(height: 20),
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () => {},
                    child: Text(
                      "Itens no carrinho: " + MenuScreenState.carrinho.length.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(height: 20),
              Text(
                "Pratos",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 32, fontFamily: 'Times New Roman', fontWeight: FontWeight.bold),
              ),
              columnProdutos,
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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

Widget itemMenu(String id, String nome, String descricao, String preco, Function() funcao) {
  return Container(
    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
    width: 330,
    height: 120,
    child: Card(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      color: Colors.white,
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center, children: [
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
          IconButton(onPressed: funcao, icon: Icon(Icons.add_shopping_cart))
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
        ),
      ]),
    ),
  );
}



/*
final List<String> pratosDeComida = ['Pasta Carbonara', 'Ceviche', 'Paella'];
final List<String> valoresComida = ['25', '27', '50'];

Widget buildPratos (BuildContext context) {
    return ListView.builder(
                      itemCount: pratosDeComida.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Icon(Icons.add_circle), 
                            title: Text(pratosDeComida[index]),
                            subtitle: Text('\$${valoresComida[index]}'),
                          ),
                        );
                      },
                    );
                  }


final List<String> bedidas = ['Água', 'Suco', 'Refrigerante'];
final List<String> valoresBebidas = ['25', '27', '50'];

Widget buildBebidas (BuildContext context) {
    return ListView.builder(
                      itemCount: bedidas.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Icon(Icons.add_circle), 
                            title: Text(bedidas[index]),
                            subtitle: Text('\$${valoresBebidas[index]}'),
                          ),
                        );
                      },
                    );
                  }
*/
import 'package:flutter/material.dart';
import 'package:projetofinalflutter/components/card_big.dart';

class ConfirmacaoScreen extends StatefulWidget {
  const ConfirmacaoScreen({super.key, required this.title});

  final String title;

  @override
  State<ConfirmacaoScreen> createState() => ConfirmacaoScreenState(title);
}

class ConfirmacaoScreenState extends State<ConfirmacaoScreen> {
  ConfirmacaoScreenState(this.title);
  var title;

  @override
  Widget build(BuildContext) {
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
                Text(
                  this.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontFamily: 'Times New Roman', fontStyle: FontStyle.italic),
                ),
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
                    cardBig("flagcliente", "flagpedido", "flagvalortotal", Color.fromARGB(255, 164, 158, 141)),
                  ],
                )),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(100, 0, 100, 0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      )),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Sair', style: TextStyle(fontSize: 20, color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}

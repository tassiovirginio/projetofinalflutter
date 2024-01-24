import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 185, 177, 155),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 232, 231, 229),
          title: Text('Restaurante Sabores do Mundo', style: TextStyle (fontWeight: FontWeight.bold, fontSize: 22)),
          elevation: 70,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
          centerTitle: true,
        ),
        
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[ 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text(" Sabores do Mundo",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 28,fontFamily: 'Times New Roman',fontStyle: FontStyle.italic), ),
              Image.asset('lib/assets/logo2.png',height: 80),
            ],),

            Text("Pedido Feito com Sucesso",
            textAlign: TextAlign.center, style: TextStyle(fontSize: 30,fontFamily: 'Times New Roman',fontWeight: FontWeight.bold), ),
            

             Container(
              //color: Color.fromARGB(255, 241, 234, 234),
              height: 180,
              width: 100,
              child:             
              Container(
                  margin: EdgeInsets.all(20.0),
                  height: 150,
                  width: 130,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          cardBig("Produtos \nEm estoque", "    200", Colors.red),
                          ],
                        )
                  ),
            ),

          Container(
                    margin: EdgeInsets.fromLTRB(100,0,100,0),
                    child:                
                      ElevatedButton(
                      style: ElevatedButton.styleFrom(                      
                      primary: Colors.green,
                      shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                      )),
                      onPressed: () {},
                      child: Text('Entrar', style: TextStyle(fontSize: 20, color: Colors.white))
                    ), 
                  ),

          ],
          ),
        ),
    );
  }
}



Widget cardBig(String texto, String msg, Color color) {
  return Card(
    color: color,
    child: Row(
      children: <Widget>[
        Container(
              margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
              alignment: Alignment.centerLeft,
              height: 150,
              width: 350,
              child: Column(
              children: [
                  Text(
                    texto,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(width: 100, height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        msg,
                        style: TextStyle(fontSize: 40, color: Colors.white),
                        ), 
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          )),
                          onPressed: () {},
                          child: Text('Mais', style: TextStyle(fontSize: 20, color: Colors.white))
                        ),],),
                ],
              ),
            ),
      ]
      
    ),
    
  );
}
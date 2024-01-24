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
              margin: EdgeInsets.all(10.0),
              //color: Color.fromARGB(255, 202, 202, 217),
              width: 100,
              child: Column(),
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


InputDecoration getAuthenticationImputDecoration(String hintLabel) {
  return InputDecoration (
          hintText: hintLabel,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
          fillColor: const Color.fromARGB(255, 201, 183, 183),
          filled: true,
          labelStyle: TextStyle(fontSize: 20,color: Colors.black),
  );
}

import 'package:flutter/material.dart';
void main() => runApp(MyApp());


final List<String> pratosDeComida = ['Pasta Carbonara', 'Ceviche', 'Paella'];
final List<String> valores = ['25', '27', '50'];

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                    IconButton(
                      onPressed: () => {},
                      icon: Icon(Icons.list, size: 50.0,),
                    ),
                    Text("Menu",
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 38,fontFamily: 'Times New Roman',fontStyle: FontStyle.italic), ),
                  ]
                ),
                Column(children: [
                  Image.asset('lib/assets/logo.png',height: 100),
                ],)
              ],),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pratos",
                  textAlign: TextAlign.start, style: TextStyle(fontSize: 32,fontFamily: 'Times New Roman',fontWeight: FontWeight.bold), 
                ),
                Container(
                  height: 400,
                  width: 370,
                  child:
                    ListView.builder(
                      itemCount: pratosDeComida.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Icon(Icons.add_circle), 
                            title: Text(pratosDeComida[index]),
                            subtitle: Text('\$${valores[index]}'),
                          ),
                        );
                      },
                    ),
                )

              ],),

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
                      child: Text('Sair', style: TextStyle(fontSize: 20, color: Colors.white))
                    ), 
              ),

          ],
          ),
        ),
    );
  }
}


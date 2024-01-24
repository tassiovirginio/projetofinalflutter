import 'package:flutter/material.dart';
import 'package:projetofinalflutter/components/authentication_imput_decoration.dart';
import 'package:projetofinalflutter/routes/routes.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key, required this.title});

  final String title;

  @override
  State<CheckInScreen> createState() => CheckInScreenState();
}

class CheckInScreenState extends State<CheckInScreen> {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 185, 177, 155),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 232, 231, 229),
          title: Text('Restaurante Sabores do Mundo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          elevation: 70,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('lib/assets/logo.png', height: 150),
            Text(
              "Sabores do Mundo",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 38, fontFamily: 'Times New Roman', fontStyle: FontStyle.italic),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              width: 100,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        decoration: getAuthenticationImputDecoration('Usuário'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        decoration: getAuthenticationImputDecoration('Senha'),
                      ),
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
                            Navigator.of(context).pushNamed(Routes.FINAL);
                          },
                          child: Text('Entrar', style: TextStyle(fontSize: 20, color: Colors.white))),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

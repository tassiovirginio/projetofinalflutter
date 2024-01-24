import 'package:flutter/material.dart';

Widget cardBig(String cliente, String pedido, String total, Color color) {
  return Card(
      color: color,
      child: Container(
        margin: EdgeInsets.all(10.0),
        height: 140,
        width: 250,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Cliente:          $cliente",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                "Pedido nº:     $pedido",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                "Total:         RS $total",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ]),
      ));
}

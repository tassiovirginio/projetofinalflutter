import 'package:flutter/material.dart';

Widget cardBig({required String cliente, required String pedido, required String total, required Color color}) {
  return Card(
      color: color,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        height: 140,
        width: 250,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Cliente:          $cliente",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                "Pedido nº:     $pedido",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                "Total:         R\$ $total",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ]),
      ));
}

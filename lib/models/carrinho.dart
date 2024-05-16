import 'package:projetofinalflutter/models/item.dart';

class Carrinho {
  List<Item> lista = [];
  get length => lista.length;
  void remove(Item item) => lista.remove(item);
  double get total => _calcularTotal();

  _calcularTotal() {
    double total = 0;
    for (var item in lista) {
      double valor = double.parse(item.valor);
      total += valor;
    }
    return total;
  }
}

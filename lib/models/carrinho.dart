import 'package:projetofinalflutter/models/item.dart';

class Carrinho {
  List<Item> _lista = [];
  List<Item> get lista => _lista;
  set lista(List<Item> lista) => _lista = lista;
  get length => _lista.length;
  void remove(Item item) => _lista.remove(item);
  double get total => _calcularTotal();

  _calcularTotal() {
    double total = 0;
    _lista.forEach((item) {
      double valor = double.parse(item.valor);
      total += valor;
    });
    return total;
  }
}

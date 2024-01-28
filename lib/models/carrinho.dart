import 'package:projetofinalflutter/models/item.dart';

class Carrinho {
  List<Item> _lista = [];
  List<Item> get lista => _lista;
  set lista(List<Item> lista) => _lista = lista;
  get length => _lista.length;
  void remove(Item item) => _lista.remove(item);
}

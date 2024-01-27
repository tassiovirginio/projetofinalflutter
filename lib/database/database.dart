import 'dart:io';

import 'package:gsheets/gsheets.dart';

const _credentials = r'''
{
  "type": "service_account",
  "project_id": "gsheets-412215",
  "private_key_id": "19bf19153b8746138c5fa952c27f8cd47fecfa01",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCzou3rtxbN7i6F\n/2zG0yDqhPhF2gPtDRbEUYYy1f64rG+zXWjy4+EQHETiD/+8fPHG2hvJuymswYnp\n27AJXvJJV4QiV9JdMD7SafGoIQW4F2FJSEIPsfjDk9BdztyeNfHIsR0Xe1hVy3a2\n6IP8vWO1yxOOXClaWOuWpNn0uGAf7Ws322tK4rhM+7KaViIpY5D6WNuwHlIYe74p\nMf4MhSBeZnx9d8ER+Y+MY8ru9c/8G82qFLP6y5NCJmJD+swEbBumUOz5212Z79Bc\n774SxyQ0bSUx10uwURQ3SU//tYdXOVjbovXWHbHy3niaSaBFfoM5DOTpBJjXEU4v\nbt+iIondAgMBAAECggEAOyY1eE2frSw11np+C1PevUoOZBW/ADG0ou0DJr8O8ikZ\nWLKzyXKem4rrZZKGDz8G74bG6px9wvwxWLc1VkiUt/Cguhw30OZ/cRJgd490DiNo\nrdQkqH1eH6wOyqzAOTojBIXJQf+j3RAzZVPXjgOgju4w4MnY9f5ciIx8lheV0zzw\nasBYK68NxIBFGqc80TWOQTzRZo14XeeCPBWkyviHtrYPk3kOS1Eu6XrTGGYXl829\nScerotZl4rEn+e2I+90e8PfUBjOScson3Mmei8SdWh3aQ8qzZPU+iOHKxCttNir/\nBwcUdHt7Hwv28nT8eMElrshrsl4ZNpiGBhwO3mMTkwKBgQDu3PCaND8s0/GE8GQN\nrblv09jellrY73VRFF+bCrshi8eOE3mP9Ko4OyN6n1Wb6i5KtbsgkWqtPrtmNPVE\nz972THQ0oR9CqgX4M0GYo2Vn9MIg9V9UNF27i1S4pbxO8eJ2YxnNC3RpUjpzbH8K\njg69b7dyL9s/fWFG3jsOw+nsUwKBgQDAhjVlJs48G6KWpDSshvpA3OmG9qBmpLeh\nMeNMj4UM/YhJgq2yje08gsDQZPceWxhy8GZlGROjKGB+4M2C9yWKr0X8zWbCnjF0\nSbeAlKjiB6v2CMsW30FJf04Dem2/QrDSj+ejKjIWfmEHgUXZbacPtlb3g/nG6Oh7\n1EPcat1rDwKBgQDV+wt3uRJXQE7+vrODJXwX1/pR/PPJn0rDpbK4G/bj6GqOtpeS\nBKZw1VnFQfPZRwLNXtwSIvMj3CzZNNv8FxQwJPF9LFHq0JGkdZZv/QCdDkDScb5C\nmt7VYc411BNLzZkIYWL9syNILqe6OxncBMLjpa77FjAdQl7gs7jIU229jQKBgGWZ\n7i/VjN0X0HQjcFDkYsk8TFmXagsBPo9pHoVW8GZsnjH9LuGeGOboMg1IW0m/1WVD\nDSapVz2xn0sWJB7LgxpvaUYCuApZJcwy4w6OZZnzZoLPHS6S34eEEY2wXJ6k+WAF\n5b6sFAbe5yHozQ3z2khmd/rjwTuByr8exDlchEFtAoGAAz9tUsNw/excQzZsFGkG\nFS8vhy7cEUDmaJ7Ht9wFbvmYTrzoud2bdK9sp1ypnLNLEB51bDrhxGC7HlZRE+YE\n5BgobN1tvwuqtPGcHwXdjRG8Rzaf7n6OyQgaOmFodrWVnzaRGU/OAzWgbQge73/h\nr9W7xRmleVK2dw08VhULE0A=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheets-412215.iam.gserviceaccount.com",
  "client_id": "102231084667193182761",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-412215.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';
const _spreadsheetId = '1YBngv6BzG_xqwA_H8HaXQeRab1oYnx_sp_gYsx2U1O8';

class DataBase {
  static var gsheets;
  static var ss;
  static var sheetProdutos;
  static var sheetPedidos;
  static var sheetUsuarios;
  static List<List<String>>? listaProdutos;
  static List<List<String>>? listaPedidos;
  static List<List<String>>? listaUsuarios;

  static carregarSheet() async {
    gsheets = GSheets(_credentials);
    ss = await gsheets.spreadsheet(_spreadsheetId);

    listaProdutos = await criarTabelaMenu(DataBase.ss);

    carregarLista(listaProdutos);

    listaPedidos = await criarTabelaPedidos(DataBase.ss);

    carregarLista(listaPedidos);

    listaUsuarios = await criarTabelaUsuarios(DataBase.ss);

    carregarLista(listaUsuarios);

    // realizarPedido("11", "Tassio", "6399999999", "Rua XX, XXX - Nova Cidade", "Pizza;X-burger", "40");
  }

  static Future<List<List<String>>> criarTabelaMenu(Spreadsheet ss) async {
    sheetProdutos = await ss.worksheetByTitle('menu');

    if (sheetProdutos == null) {
      sheetProdutos = await ss.addWorksheet('menu');
      // insert list in row #1
      final primeiraLinha = ['id', 'nome', 'descricao', 'valor'];
      await sheetProdutos.values.insertRow(1, primeiraLinha);
      print(await sheetProdutos.values.row(1));

      final primeiraColuna = ['0', '1', '2', '3', '4'];
      await sheetProdutos.values.insertColumn(1, primeiraColuna, fromRow: 2);
      print(await sheetProdutos.values.column(1, fromRow: 2));

      final segundaColuna = ['Pizza', 'X-Tudo', 'Lasanha', 'Suco', 'Refri'];
      await sheetProdutos.values.insertColumnByKey('nome', segundaColuna);
      print(await sheetProdutos.values.columnByKey('nome'));

      final terceiraColuna = ['calabresa', 'carne;salada', 'queijo;carne', 'laranja', 'coca'];
      await sheetProdutos.values.insertColumnByKey('descricao', terceiraColuna);
      print(await sheetProdutos.values.columnByKey('descricao'));

      final quartaColuna = ['30,00', '10,00', '40,00', '5,00', '5,00'];
      await sheetProdutos.values.insertColumnByKey('valor', quartaColuna);
      print(await sheetProdutos.values.columnByKey('valor'));
    }

    // listaProdutos = await sheetProdutos.values.allRows();

    return await sheetProdutos.values.allRows();
  }

  static Future<List<List<String>>> criarTabelaPedidos(Spreadsheet ss) async {
    sheetPedidos = await ss.worksheetByTitle('pedidos');

    if (sheetPedidos == null) {
      sheetPedidos = await ss.addWorksheet('pedidos');
      // insert list in row #1
      final primeiraLinha = ['id', 'nome', 'numero', 'endereco', 'lista', 'total'];
      await sheetPedidos.values.insertRow(1, primeiraLinha);
      // print(await sheetPedidos.values.row(1));

      final primeiraColuna = ['0', '1', '2'];
      await sheetPedidos.values.insertColumn(1, primeiraColuna, fromRow: 2);
      // print(await sheetPedidos.values.column(1, fromRow: 2));

      final segundaColuna = ['Tassio', 'Lily', 'Pedro'];
      await sheetPedidos.values.insertColumnByKey('nome', segundaColuna);
      // print(await sheetPedidos.values.columnByKey('nome'));

      final terceiraColuna = ['6399999999', '7199999999', '7199999999'];
      await sheetPedidos.values.insertColumnByKey('numero', terceiraColuna);
      // print(await sheetPedidos.values.columnByKey('numero'));

      final enderecoColuna = ['Rua XX, XXX - Nova Cidade', 'Rua XX, XXX - Imbuí', 'Rua XX, XXX - Ondina'];
      await sheetPedidos.values.insertColumnByKey('endereco', enderecoColuna);
      // print(await sheetPedidos.values.columnByKey('endereco'));

      final listaColuna = ['Pizza;X-burger', 'Pizza; Refri', 'Pizza;Suco'];
      await sheetPedidos.values.insertColumnByKey('lista', listaColuna);
      // print(await sheetPedidos.values.columnByKey('lista'));

      final totalColuna = ['40', '50', '50.1'];
      await sheetPedidos.values.insertColumnByKey('total', totalColuna);
      // print(await sheetPedidos.values.columnByKey('total'));
    }

    return await sheetPedidos.values.allRows();
  }

  static Future<List<List<String>>> criarTabelaUsuarios(Spreadsheet ss) async {
    sheetUsuarios = await ss.worksheetByTitle('usuarios');

    if (sheetUsuarios == null) {
      sheetUsuarios = await ss.addWorksheet('usuarios');
      // insert list in row #1
      final primeiraLinha = ['id', 'nome', 'numero', 'endereco', 'login', 'senha'];
      await sheetUsuarios.values.insertRow(1, primeiraLinha);
      // print(await sheetUsuarios.values.row(1));

      final primeiraColuna = ['0', '1', '2'];
      await sheetUsuarios.values.insertColumn(1, primeiraColuna, fromRow: 2);
      // print(await sheetUsuarios.values.column(1, fromRow: 2));

      final segundaColuna = ['Tassio', 'Lily', 'Pedro'];
      await sheetUsuarios.values.insertColumnByKey('nome', segundaColuna);
      // print(await sheetUsuarios.values.columnByKey('nome'));

      final terceiraColuna = ['6399999999', '7199999999', '7199999999'];
      await sheetUsuarios.values.insertColumnByKey('numero', terceiraColuna);
      // print(await sheetUsuarios.values.columnByKey('numero'));

      final enderecoColuna = ['Rua XX, XXX - Nova Cidade', 'Rua XX, XXX - Imbuí', 'Rua XX, XXX - Ondina'];
      await sheetUsuarios.values.insertColumnByKey('endereco', enderecoColuna);
      // print(await sheetUsuarios.values.columnByKey('endereco'));

      final listaColuna = ['tassio', 'lily', 'pedro'];
      await sheetUsuarios.values.insertColumnByKey('login', listaColuna);
      // print(await sheetUsuarios.values.columnByKey('login'));
      await sheetUsuarios.values.insertColumnByKey('senha', listaColuna);
      // print(await sheetUsuarios.values.columnByKey('senha'));
    }

    return await sheetUsuarios.values.allRows();
  }

  static List<String> fazerLogin(String login, String senha) {
    List<String> retorno = [];

    listaUsuarios?.forEach((element) {
      if (element[4] == login && element[5] == senha) {
        retorno = element;
      }
    });

    return retorno;
  }

  static void carregarLista(List<List<String>>? lista) => lista?.forEach(print);

  static List<List<String>>? getPedidos() {
    while (listaPedidos == null) {
      sleep(Duration(seconds: 1));
    }
    return listaPedidos;
  }

  static List<List<String>>? getProdutos() {
    while (listaProdutos == null) {
      sleep(Duration(seconds: 1));
    }
    return listaProdutos;
  }

  static Future<List<String>> realizarPedido(
      String id, String nome, String numero, String endereco, String lista, String total) async {
    List<String> retorno = [];
    Map ultimaLinha = await sheetPedidos.values.map.lastRow();
    int novo_id = int.parse(ultimaLinha["id"]) + 1;
    await sheetPedidos.values.insertRow(novo_id, [novo_id, nome, numero, endereco, lista, total]);
    retorno = [novo_id.toString(), nome, numero, endereco, lista, total];
    return retorno;
  }
}

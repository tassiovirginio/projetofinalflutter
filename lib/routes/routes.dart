import 'package:projetofinalflutter/main.dart';
import 'package:projetofinalflutter/screens/confirmacao_screen.dart';
import 'package:projetofinalflutter/screens/finalizar_screen.dart';
import 'package:projetofinalflutter/screens/login_screen.dart';
import 'package:projetofinalflutter/screens/menu_screen.dart';

enum Routes { LOGIN, MENU, CONFIRMACAO, FINAL }

var myroutes = {
  Routes.LOGIN.name: (context) => LoginScreen(title: title),
  Routes.MENU.name: (context) => MenuScreen(title: title),
  Routes.CONFIRMACAO.name: (context) => ConfirmacaoScreen(title: title),
  Routes.FINAL.name: (context) => FinalizarScreen(title: title),
};

import 'package:projetofinalflutter/main.dart';
import 'package:projetofinalflutter/screens/finalizar_screen.dart';
import 'package:projetofinalflutter/screens/login_screen.dart';
import 'package:projetofinalflutter/screens/menu_screen.dart';

enum Routes { LOGIN, MENU, FINAL }

// class Routes {
//   static const LOGIN = '/login';
//   static const MENU = '/menu';
//   static const FINAL = '/final';
// }

var myroutes = {
  Routes.LOGIN.name: (context) => LoginScreen(title: title),
  Routes.MENU.name: (context) => MenuScreen(title: title),
  Routes.FINAL.name: (context) => FinalizarScreen(title: title),
};

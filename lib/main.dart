import 'package:flutter/material.dart';
import 'package:tuaplicacion/src/pages/homeprincipal.dart';
import 'package:tuaplicacion/src/pages/info_users.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'prueba',
      initialRoute: 'info',
      routes: {
        'home': (BuildContext context) => HomePrincipal(),
        'info': (BuildContext context) => InfoUsuario(),
      },
    );
  }
}

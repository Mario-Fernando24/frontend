import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart' as http;

class UsuarioController {
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  Future<dynamic> getUsuarioApi() async {
    final url =
        'https://randomapi.com/api/6de6abfedb24f889e0b5f675edc50deb?fmt=raw&sole';
    final resp = await http.get(url);

    return json.decode(resp.body);
  }

  Future<dynamic> getUsuarioDetalleApi() async {
    var response = await http.get('https://randomuser.me/api/');

    return json.decode(response.body);
  }
}

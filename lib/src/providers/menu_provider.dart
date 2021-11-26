import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider();

  Future<List<dynamic>> dataLoad() async {
    final resp = await rootBundle.loadString('data/menu_opt.json');

    Map dataMap = json.decode(resp);
    opciones = dataMap['results'];

    return opciones;
  }
}

final menuProvider = new _MenuProvider();

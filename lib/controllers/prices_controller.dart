import 'dart:convert';

import 'package:coinbase_clone/models/price.dart';
import 'package:http/http.dart' as http;

class PricesController {
  Future<List<Price>> pegarDados() async {
    var url = Uri.parse('https://api.coincap.io/v2/assets?limit=6');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      // print(response);
      var dados = jsonDecode(response.body);
      var listConcursoAux = dados['data'] as List;
      // List listaUsuario = jsonDecode(response.body);
      return listConcursoAux.map((e) => Price.fromJson(e)).toList();
    } else {
      throw Exception('Error ao carregar');
    }
  }
}

import 'dart:convert';

import 'package:covid19_api/env/enviroments.dart';
import 'package:covid19_api/models/datos_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CovidService with ChangeNotifier {

  Future<List<All>> getData() async {
    final res = await http.get('${Enviroments.apiUrl}', headers: 
    {
      'Content-Type': 'application/json'
    });
    List<All> paises = [];
    final Map<String, dynamic> map = jsonDecode(res.body);
    
    map.forEach((dato, index)  {
      All pais = All.fromJson(map[dato]['All']);
      paises.add(pais);
    });
    return paises;
    
  }

}
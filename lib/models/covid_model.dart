import 'dart:convert';

import 'package:covid19_api/models/pais_model.dart';

List<Covid> covidFromJson(String str) => List<Covid>.from(json.decode(str).map((x) => Covid.fromJson(x)));

String covidToJson(List<Covid> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Covid {
    Covid({
        this.pais,
    });

    Pais pais;

    factory Covid.fromJson(Map<String, dynamic> json) => Covid(
        pais: Pais.fromJson(json["Pais"]),
    );

    Map<String, dynamic> toJson() => {
        "Pais": pais.toJson(),
    };
}
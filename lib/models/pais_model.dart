import 'package:covid19_api/models/datos_model.dart';

class Pais {
    Pais({
        this.all,
    });
    String nombre;
    All all;

    factory Pais.fromJson(Map<String, dynamic> json) => Pais(
        // all: All.fromJson(json["All"]),
    );

    Map<String, dynamic> toJson() => {
        "All": all.toJson(),
    };
}
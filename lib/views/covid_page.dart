import 'dart:ui';

import 'package:covid19_api/models/datos_model.dart';
import 'package:covid19_api/service/covid_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CovidPage extends StatefulWidget {
  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Casos Covid'),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
                child: _cargarInfo(),
            ),
          ),
        )
    );
  }

  Widget _cargarInfo()  {
    final service = Provider.of<CovidService>(context);  
    return FutureBuilder(
        future: service.getData(),
        builder: (_, AsyncSnapshot<List<All>> snapshot) {
          if (snapshot.hasData) {
            final paises = snapshot.data;
            return ListView(  
              children:
                paises.map<Widget>((pais) {
                  return cargarDatos(pais);
                }).toList()
            );
          } else {
            return CircularProgressIndicator();
          }
        },
    );
  }

  cargarDatos(All pais) {
    final textStyleTitle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    final textStyleSubTitle = TextStyle(
      color: Colors.black,
      fontSize: 17,
    );
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 25
    );
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Container(
              child: Table(
                children: [
                  TableRow(
                    children: [
                      ListTile(
                      leading: Image(image: (pais.abbreviation != null)? NetworkImage('https://www.countryflags.io/${pais.abbreviation}/flat/64.png'): NetworkImage('https://www.rawshorts.com/freeicons/wp-content/uploads/2017/01/orange_webpict50_1484337223.png')),
                      title: Text((pais.country!= null)? pais.country: 'Desconocido', style: textStyleTitle,),
                      subtitle: Text((pais.continent != null)? '${pais.continent}': 'Desconocido', style: textStyleSubTitle,),
                ),
                Table(
                  children: [
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text('Confirmados'),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text((pais.confirmed != null)? '${pais.confirmed}': 'Desconocido'),
                        )
                        
                      ]
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text('Recuperados'),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text((pais.recovered != null)? '${pais.recovered}': 'Desconocido'),
                        )
                        
                      ]
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text('Muertes'),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text((pais.deaths != null)? '${pais.deaths}': 'Desconocido'),
                        )
                        
                      ]
                    )
                  ],
                )
                    ]
                  )
                ],
              )
            )
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Text('Datos', style: textStyle),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 35, top: 10),
            child: Table(
              children: [
                TableRow(
                  children: [
                    Text('Capital'),
                    Text((pais.capitalCity != null)? '${pais.capitalCity}': 'Desconocido'),
                  ]
                ),
                TableRow(
                  children: [
                    Text('Habitantes'),
                    Text((pais.population != null)? '${pais.population}': 'Desconocido'),
                  ]
                ),
                TableRow(
                  children: [
                    Text('Area'),
                    Text((pais.sqKmArea != null)? '${pais.sqKmArea} km.': 'Desconocido'),
                  ]
                ),
                TableRow(
                  children: [
                    Text('Ubicación'),
                    Text((pais.location != null)? '${pais.location}': 'Desconocido'),
                  ]
                ),
                TableRow(
                  children: [
                    Text('Esperanza de vida'),
                    Text((pais.lifeExpectancy != null)? '${pais.lifeExpectancy}': 'Desconocido'),
                  ]
                ),
                TableRow(
                  children: [
                    Text('Actualizado'),
                    Text((pais.updated != null)? '${pais.updated}': 'Desconocido'),
                  ]
                ),
                
              ],
            ),
          )
        ],
      ),
      color: Color(0xffFE6292),
    );
  }
}

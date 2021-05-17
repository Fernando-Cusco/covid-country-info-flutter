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
        backgroundColor: Colors.red[50],
        elevation: 0,
        title: Container(
          padding: EdgeInsets.only(left: 25),
          alignment: Alignment.centerLeft,
          child: Text('Info Covid', style: TextStyle(color: Colors.black, fontSize: 25)),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.red[50],
          width: double.infinity,
          height: double.infinity,
            child: Center(
              child: Container(
                  child: _cargarInfo(),
              ),
            ),
          ),
      ),
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
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              header(pais),
              content(pais),
              footer(pais)
            ],
          ),
        )
      ),
    );
  }

    Widget header (All p) {
      final textStyleTitle = TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );
      return Container(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Image(
                  image: (p.abbreviation != null)? NetworkImage('https://www.countryflags.io/${p.abbreviation}/flat/64.png'): AssetImage('assets/no-img.png'),
              )
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Text((p.country != null)? '${p.country}':'Desconocido', style: textStyleTitle),
            )
          ],
        ),
      );
    }

    Widget content(All p) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
          child: Row(
            children: [
              Chip(
                label: Text((p.confirmed != null)? 'Total contagios: ${p.confirmed}': 'Desconocido'),
                avatar: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image(
                    image: AssetImage('assets/virus.png'),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Chip(
                label: Text((p.recovered != null)? 'Total recuperados: ${p.recovered}': 'Desconocido'),
                avatar: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image(
                    image: AssetImage('assets/recuperado.png'),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Chip(
                label: Text((p.deaths != null)? 'Total muertes: ${p.deaths}': 'Desconocido'),
                avatar: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image(
                    image: AssetImage('assets/cruz.png'),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

  Widget footer(All pais) {
    final textStyleSubTitle = TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
    );
    return Container(
      padding: EdgeInsets.only(bottom: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Text((pais.updated != null)? 'Actualizado: ${pais.updated.substring(0,10)}': 'Desconocido', style: textStyleSubTitle,),
          )
        ],
      ),
    );
  }

  Widget titulo() {
    return Container(
      child: Text('Info Covid'),
    );
  }
}






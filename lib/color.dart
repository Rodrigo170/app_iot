import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class Contador extends StatefulWidget {
  Contador({Key? key}) : super(key: key);

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  String url = "http://192.168.43.119:8090/ProyectoIOT/Contador";
  String urlA = "http://192.168.43.119:8090/ProyectoIOT/Amarillo";
  String urlN = "http://192.168.43.119:8090/ProyectoIOT/Naranja";
  String urlR = "http://192.168.43.119:8090/ProyectoIOT/Rojo";
  String urlAzul = "http://192.168.43.119:8090/ProyectoIOT/Azul";

  Future<dynamic> _getContador() async {
    final respuesta = await http.get(Uri.parse(url));

    if(respuesta.statusCode==200){
      print(respuesta.body);
      return jsonDecode(respuesta.body);  
    } else {
      print("Error con la respuesta");
    }
  }

  Future<dynamic> _getContadorAmarrillo() async {
    final respuesta = await http.get(Uri.parse(urlA));

    if(respuesta.statusCode==200){
      print(respuesta.body);
      return jsonDecode(respuesta.body);  
    } else {
      print("Error con la respuesta");
    }
  }

  Future<dynamic> _getContadorNaranja() async {
    final respuesta = await http.get(Uri.parse(urlN));

    if(respuesta.statusCode==200){
      print(respuesta.body);
      return jsonDecode(respuesta.body);  
    } else {
      print("Error con la respuesta");
    }
  }

  Future<dynamic> _getContadorRojo() async {
    final respuesta = await http.get(Uri.parse(urlR));

    if(respuesta.statusCode==200){
      print(respuesta.body);
      return jsonDecode(respuesta.body);  
    } else {
      print("Error con la respuesta");
    }
  }

  Future<dynamic> _getContadorAzul() async {
    final respuesta = await http.get(Uri.parse(urlAzul));

    if(respuesta.statusCode==200){
      print(respuesta.body);
      return jsonDecode(respuesta.body);  
    } else {
      print("Error con la respuesta");
    }
  }


   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         elevation: 0.0,
        backgroundColor: Color(0xff251F34),
        title: Text('Contador'),
      ),
      body: FutureBuilder<dynamic>(
        future: _getContador(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            int c = snapshot.data;
            print(snapshot);
            return CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      <Widget>[
                        Container(
                          height: 110,
                          width: 500,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(30),
                          color: Colors.grey[850],
                          child: Text('Objetos capturados \n'+c.toString(),
                            style: TextStyle(fontSize: 20, color: Colors.white),
                            textAlign: TextAlign.center
                          ),
                        ),
                        amarillo(),
                          naranja(),
                          rojo(),
                          azul()

                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            print("No hay información");
            return Text("Sin data");
          }
        },
        //initialData: Center(child: CircularProgressIndicator()),

      )


    );
  }

  Widget amarillo(){
    return Container(
      child: FutureBuilder<dynamic>(
        future: _getContadorAmarrillo(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            int c = snapshot.data;
            print(snapshot);
            return Container(
              child: Column(
                children: [
                  Container(
                    height: 110,
                    width: 500,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(30),
                    color: Colors.amber,
                    child: Text('Amarillo \n'+c.toString(),
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center
                    ),
                  ),
                  
                ],
              ),
            ) ;
          } else {
            
            return Text("Sin data");
          }
        },

      )

    );
  }

  Widget naranja(){
    return Container(
      child: FutureBuilder<dynamic>(
        future: _getContadorNaranja(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            int c = snapshot.data;
            print(snapshot);
            return Container(
              child: Column(
                children: [
                  Container(
                    height: 110,
                    width: 500,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(30),
                    color: Colors.orange,
                    child: Text('Narnaja \n'+c.toString(),
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center
                    ),
                  ),
                  
                ],
              ),
            ) ;
          } else {
            
            return Text("Sin data");
          }
        },

      )

    );
  }

  Widget rojo(){
    return Container(
      child: FutureBuilder<dynamic>(
        future: _getContadorNaranja(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            int c = snapshot.data;
            print(snapshot);
            return Container(
              child: Column(
                children: [
                  Container(
                    height: 110,
                    width: 500,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(30),
                    color: Colors.red,
                    child: Text('Rojo \n'+c.toString(),
                      style: TextStyle(fontSize: 20,  color: Colors.white),
                      textAlign: TextAlign.center
                    ),
                  ),
                  
                ],
              ),
            ) ;
          } else {
            
            return Text("Sin data");
          }
        },

      )

    );
  }

   Widget azul(){
    return Container(
      child: FutureBuilder<dynamic>(
        future: _getContadorAzul(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            int c = snapshot.data;
            print(snapshot);
            return Container(
              child: Column(
                children: [
                  Container(
                    height: 110,
                    width: 500,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(30),
                    color: Colors.blue,
                    child: Text('Azul \n'+c.toString(),
                      style: TextStyle(fontSize: 20,  color: Colors.white),
                      textAlign: TextAlign.center
                    ),
                  ),
                  
                ],
              ),
            ) ;
          } else {
            
            return Text("Sin data");
          }
        },

      )

    );
  }

}
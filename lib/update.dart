// ignore_for_file: prefer_const_constructors

import 'package:app_oit/MongoDBModel.dart';
import 'package:app_oit/dbHelper/mongodb.dart';
import 'package:app_oit/insert.dart';
import 'package:flutter/material.dart';

class MongoDbUpdate extends StatefulWidget {
  const MongoDbUpdate({Key? key}) : super(key: key);

 
  @override
  State<MongoDbUpdate> createState() => _MongoDbUpdateState();
}

class _MongoDbUpdateState extends State<MongoDbUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            FutureBuilder(
              future: MongoDatabase.getData(),
              builder: (context, AsyncSnapshot snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                    child: CircularProgressIndicator(),
                );
              } else {
                if(snapshot.hasData){
                   return ListView.builder(
                     itemCount: snapshot.data.length,
                     itemBuilder: (context, index){
                     return displayCard(MongoDbModel.fromJson(snapshot.data[index]));
                   });
                } else {
                  return Center(
                    child: Text("No Data found"),
                    );
                }
              }
            } ,)
        ),
    );
  }

  Widget displayCard(MongoDbModel data){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${data.id.$oid}"),
                SizedBox(height: 5,),
                Text("${data.color}"),
                SizedBox(height: 5,),
                Text("${data.descripcion}"),
                SizedBox(height: 5,),

                Image.network("${data.imagen}", width: 45)
              ],
            ),
            IconButton(
              onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (BuildContext context) {
                  return MongoDBInsert();
                }, 
                settings: RouteSettings(arguments: data))).then((value) {
                  setState(() {
                    
                  });
                });
            }, 
            
            icon: Icon(Icons.edit))
          ],
        ),
      ),
    );
  }
  
}
import 'package:app_oit/MongoDBModel.dart';
import 'package:app_oit/dbHelper/mongodb.dart';
import 'package:flutter/material.dart';

class MongoDbDelete extends StatefulWidget {
  MongoDbDelete({Key? key}) : super(key: key);

  @override
  State<MongoDbDelete> createState() => _MongoDbDeleteState();
}

class _MongoDbDeleteState extends State<MongoDbDelete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: MongoDatabase.getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                 return _dataCard(
                      MongoDbModel.fromJson(snapshot.data[index])
                  );
                });
            } else{
              return Center(
                child: Text("No Data Found"),
              );
            }
          }
        },)), 
    );
  }

  Widget _dataCard(MongoDbModel data){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _text(data.color,),
                  SizedBox(
                    height: 10,
                  ),
                  _text(data.descripcion),
                  SizedBox(height: 10,),
                  Image.network(data.imagen,  width: 45)
                ],
              ),
              IconButton(onPressed: () async {
                await MongoDatabase.delete(data);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Record Deleted"))
                );
                setState(() {
                  
                });

              }, icon: Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(String value){
    return Text(
      value,
      style: TextStyle(fontSize: 20),
    );
  }
}
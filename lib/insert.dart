import 'package:app_oit/MongoDBModel.dart';
import 'package:app_oit/dbHelper/mongodb.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;



class MongoDBInsert extends StatefulWidget {
  MongoDBInsert({Key? key}) : super(key: key);

  @override
  State<MongoDBInsert> createState() => _MongoDBInsertState();
}

class _MongoDBInsertState extends State<MongoDBInsert> {
  var labelColor = new TextEditingController();
  var descColor = new TextEditingController();
  var urlColor = new TextEditingController();

  var _checkInsertUpdate = "Insert";

  @override
  Widget build(BuildContext context) {

    MongoDbModel data = 
      ModalRoute.of(context)!.settings.arguments as MongoDbModel;

      if(data!=null){
        labelColor.text = data.color;
        descColor.text = data.descripcion;
        urlColor.text = data.imagen;
        _checkInsertUpdate = "Update";
      }


    return Scaffold(
      body: SafeArea(
        child: Column(
          children:<Widget>[
          Text(
              _checkInsertUpdate,
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 50,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0), //interno
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue, width: 3.0)
              ),
              child: TextField(
                controller: labelColor,
                decoration: InputDecoration(labelText: "Color",
                ),
              ),
            ),
            SizedBox(height: 30,),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0), //interno
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue, width: 3.0)
              ),
              child: TextField(
                controller: descColor,
                decoration: InputDecoration(labelText: "Descripción"),
              ),
            ),

            SizedBox(height: 30,),

            Container(
             padding: const EdgeInsets.symmetric(horizontal: 20.0), //interno
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue, width: 3.0)
              ),
              child: TextField(
                controller: urlColor,
                minLines: 3,
                maxLines: 5,
                decoration: InputDecoration(labelText: "URL Imagen"),
              ),
            ),
          const  SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {

                if(_checkInsertUpdate=="Update"){
                  _updateData(data.id, labelColor.text, 
                  descColor.text, urlColor.text);
                } else {
                   _insertData(labelColor.text, descColor.text, urlColor.text);
                }
               
              }, 
              child: Text(_checkInsertUpdate))
          ],
          ),
        ),
    );
  }

  Future<void> _updateData(var id, String lcolor, String dcolor, String url ) async{
    final updateData = MongoDbModel(id: id, color: lcolor, descripcion: dcolor, imagen: url);

    await MongoDatabase.update(updateData)
        .whenComplete(() => Navigator.pop(context));
  }

  Future<void> _insertData(String lcolor, String dcolor, String url) async{
    var _id = M.ObjectId();
    final data = MongoDbModel(
      id: _id, color: lcolor, descripcion: dcolor, imagen: url);
    var result = await MongoDatabase.insert(data);
   // ScaffoldMessenger.of(context).showMaterialBanner(SnackBar(content: Text("Inserted ID" + _id.$oid)));
    _clearAll();  
    
  }

  void _clearAll(){
    labelColor.text = "";
    descColor.text="";
    urlColor.text="";
  }

}

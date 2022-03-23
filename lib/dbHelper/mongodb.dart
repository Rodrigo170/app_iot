import 'dart:developer';

import 'package:app_oit/MongoDBModel.dart';
import 'package:app_oit/dbHelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase{
  static var db , userCollection;
  static connect() async{
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getData() async{
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static Future<void> update(MongoDbModel data) async{
    var result = await userCollection.findOne({"_id": data.id});
    result['color'] = data.color;
    result['descripcion'] = data.descripcion;
    result['imagen'] = data.imagen;

    var response = await userCollection.save(result);
    inspect(response);
  }

  static Future<String> insert(MongoDbModel data) async{
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Dato insertado";
      } else {
        return "Error al insertar";
      }

    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
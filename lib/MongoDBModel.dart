// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel welcomeFromJson(String str) => MongoDbModel.fromJson(json.decode(str));

String welcomeToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
    MongoDbModel({
       required this.id,
       required this.color,
       required this.descripcion,
       required this.imagen,
    });

    ObjectId id;
    String color;
    String descripcion;
    String imagen;

    factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
        id: json["_id"],
        color: json["color"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "color": color,
        "descripcion": descripcion,
        "imagen": imagen,
    };
}

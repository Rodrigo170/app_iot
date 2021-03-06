
import 'package:app_oit/color.dart';
import 'package:app_oit/dbHelper/mongodb.dart';
import 'package:app_oit/menu.dart';
import 'package:app_oit/signin.dart';
import 'package:app_oit/update.dart';
import 'package:flutter/material.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }


}

class MyHomePage extends StatefulWidget {
    MyHomePage({Key? key}) : super(key: key);
  
    @override
    State<MyHomePage> createState() => _MyHomePageState();
  }
  
  class _MyHomePageState extends State<MyHomePage> {
  

    @override
    Widget build(BuildContext context) {
      return Scaffold(body: SafeArea(child: Text("Heloo")));
    }
  }

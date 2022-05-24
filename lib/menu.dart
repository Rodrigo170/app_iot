import 'package:app_oit/color.dart';
import 'package:app_oit/signin.dart';
import 'package:flutter/material.dart';


class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    

    return Container(
      child: Drawer(
        child: Container(
          color: Color(0xFF1a2f45),
          child: Column(
            children: [
              Container(
                //width: 100,
                height: 150,
                margin: const EdgeInsets.only(top: 50),
                child: Image.asset('asset/images/logo.png'),
              ),
              Container(
                padding: const EdgeInsets.all(40),
                width: double.infinity,
                child: TextButton(
                  child: Text('Inicio',
                  style: TextStyle(fontSize: 25.0),
                  ),
                onPressed: (){},
                )
              ),
               Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: TextButton(
                  child: Text('Contador',
                  style: TextStyle(fontSize: 25.0),
                  ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Contador(),
                  ));
                },
                )
              ),
              Expanded(child: Container()),
               Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: TextButton(
                  child: Text('Cerrar Sesión',
                  style: TextStyle(fontSize: 25.0,color: Colors.white),
                  ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Login()
                    ));
                },
                )
              ),

            ],
          ),
        ),
      ),
    );
  }

  
}
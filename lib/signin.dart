import 'package:app_oit/update.dart';
import 'package:app_oit/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login  extends StatefulWidget {
  Login ({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  Future save() async {
    var res = await http.post(Uri.parse("http://192.168.43.119:3000/signin"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'email': user.usuario,
          'password': user.password
        });
    print(res.body);
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => MongoDbUpdate()));
  }

  User user = User('', '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff251F34),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(

          children: [
              Container(
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children:<Widget> [
                       SizedBox(height: 150,),
                       Padding(
                         padding: const EdgeInsets.only(top: 60.0),
                         child: Center(
                           child: Container(
                             width: 200,
                             height: 150,
                             child: Image.asset('asset/images/logo.png')),
                           ),
                         ),
                       SizedBox(height: 25,),
                       Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller: TextEditingController(text: user.usuario),
                            onChanged: (value) {
                              user.usuario = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter something';
                              } else if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return null;
                              } else {
                                return 'Enter valid email';
                              }
                            },
                             style: (
                                TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400
                                )
                              ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.blue,
                                ),
                                hintText: 'Enter Email',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.blue)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.blue)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.red)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.red))),
                          ),
                        ),
                        SizedBox(height: 25,),
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              controller: TextEditingController(text: user.password),
                              onChanged: (value) {
                                user.password = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter something';
                                }
                                return null;
                              },
                              style: (
                                TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400
                                )
                              ),
                              cursorColor: Colors.white,
                              obscureText: true,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.blue,
                                  ),
                                  hintText: 'Enter Password',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.blue)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.blue)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.red)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.red))),
                            ),
                          ),

                           Padding(
                                padding: EdgeInsets.fromLTRB(55, 16, 16, 0),
                                child: Container(
                                  height: 50,
                                  width: 400,
                                  child: FlatButton(
                                      color: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16.0)),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          save();
                                        } else {
                                          print("not ok");
                                        }
                                      },
                                      child: Text(
                                        "Signin",
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      )),
                                ),
                              ),



                     ],
                  ),
                ),
              )
          ],

        ),
      ),
    );
  }
}
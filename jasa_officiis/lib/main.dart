import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jasa_officiis/homepage.dart';

void main() => runApp(new MyApp());

String username = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.light, primaryColor: Colors.indigo),
      home: new MyStatefulWidget(),
      routes: <String, WidgetBuilder>{
        '/homepage': (BuildContext context) => new HomePage(
              username: username,
            )
      },
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _proseslogin() async {
    final response = await http
        .post("http://127.0.0.1/login_flutter/proses_login.php", body: {
      "username": user.text,
      "password": pass.text,
    });
    var dataadmin = json.decode(response.body);

    if (dataadmin.length == 1) {
      Navigator.pushReplacementNamed(context, '/homepage');
      setState(() {
        username = dataadmin[0]['username'];
      });
    } else {
      setState(() {
        msg = "Login Gagal";
      });
    }
    return dataadmin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Officiis"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Image.asset('img/logoo.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "Username",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                  controller: user,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Masukkan Username',
                  )),
              Text(
                "Password",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Password',
                ),
              ),
              SizedBox(height: 30,),
              RaisedButton(
               child: Text(
              'Login',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              ),
                padding: EdgeInsets.symmetric(vertical:25,horizontal:60),
                color: Colors.indigo,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                onPressed: () {
                  _proseslogin();
                },
              ),
          
              Text(
                msg,
                style: TextStyle(fontSize: 15.0, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}

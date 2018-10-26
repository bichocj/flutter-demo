import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/login/login_screen.dart';
import 'package:flutter_demo/screens/settings.dart';
import 'package:flutter_demo/screens/clients/client_screen.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: new MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
       routes: {          
          '/': (BuildContext context) => LoginScreen(),          
          '/clients': (BuildContext context) => ClientScreen(),
          '/settings': (BuildContext context) => Settings(),
        },
    );
  }
}

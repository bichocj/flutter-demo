import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/login/login_screen.dart';
import 'package:flutter_demo/my_tabs.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      /*title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      home: LoginScreen(),
      //initialRoute: '/',
      routes: {          
        //  '/': (BuildContext context) => LoginScreen(),          
        //  '/clients': (BuildContext context) => ClientScreen(),
        //  '/settings': (BuildContext context) => Settings(),
        MyTabs.routeName : (BuildContext context) => MyTabs()
      },
    );
  }
}


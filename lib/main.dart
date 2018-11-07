import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/login/login_screen.dart';
import 'package:flutter_demo/my_tabs.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {  

  @override
  MyAppState createState() => new MyAppState();

  // This widget is the root of your application.
  
}


class MyAppState extends State<MyApp>{

  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> msg) {
        print(" onLaunch called ${(msg)}");
      },
      onResume: (Map<String, dynamic> msg) {
        print(" onResume called ${(msg)}");
      },
      onMessage: (Map<String, dynamic> msg) {
        //showNotification(msg);
        print(" onMessage called ${(msg)}");
      },
    );
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, alert: true, badge: true));
    firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings setting) {
      print('IOS Setting Registed');
    });
    firebaseMessaging.getToken().then((token) {
      print(token);
    });
  }
  
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

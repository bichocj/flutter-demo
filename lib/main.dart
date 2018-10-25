import 'package:flutter/material.dart';
import 'package:flutter_demo/Login.dart';
import 'package:flutter_demo/Settings.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _title = "Please login";
  Widget _screen;
  Login _login;
  Settings _settings;
  bool _authenticated;

  _MyHomePageState(){
    _login = new Login(onSubmit: (){onSubmit();}, );
    _settings = new Settings();
    _screen = _login;
    _authenticated = false;
  }

  void onSubmit(){
    print('before request to the server');
    String url = "https://flutter-demo-server.herokuapp.com/accounts/api/login/";

    http
    .post(url, body: {"username": _login.username, "password": _login.password})
    .then((http.Response response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });


    print("Login with "+ _login.username);
    if(_login.username == 'user' && _login.password == 'pwd'){
      _setAuthenticated(true);
    }else{
      print("Usuario y contraseña incorrecto");
    }
  }

  void goHome(){
    print('go home');
    setState((){
      if(_authenticated == true){
        _screen = _settings;        
      }else{
        _screen = _login;
      }
    });
  }

  void _setAuthenticated(bool auth){
    setState((){
      if(auth==true){
        _screen = _settings;
        _title = 'Welcome';
      }else{
        _screen = _login;
        _title = 'Please Login';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(_title),
        actions: <Widget>[
          new IconButton(
            icon:Icon(Icons.exit_to_app),
            onPressed: (){
              _setAuthenticated(false);
            },
            tooltip: "Salir",
          )
        ],
      ),
      body: _screen
      
    );
  }
}


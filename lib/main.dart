import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/login/login_screen.dart';
import 'package:flutter_demo/screens/settings.dart';
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
          '/second': (BuildContext context) => Settings(),
        },
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
  LoginScreen _login;
  Settings _settings;
  bool _authenticated;

  _MyHomePageState(){
    _login = new LoginScreen();
    _settings = new Settings();
    _screen = _login;
    _authenticated = false;
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


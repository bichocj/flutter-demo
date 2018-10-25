import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key key,
    @required this.onSubmit    
  }) : super(key:key);

  final VoidCallback onSubmit;
  static final TextEditingController _username = new TextEditingController();
  static final TextEditingController _password = new TextEditingController();

  String get username => _username.text;
  String get password => _password.text;

  @override
  Widget build(BuildContext context){
    return new Column(children: <Widget>[
      new TextField(controller: _username, decoration: new InputDecoration(hintText: 'Enter a username'),),
      new TextField(controller: _password, decoration: new InputDecoration(hintText: 'Enter a password'),),
      new RaisedButton(
        child: new Text("Iniciar sesion"),
        onPressed: (){this.onSubmit();},
      )
    ],
    );
  }
}
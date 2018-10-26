import 'package:flutter/material.dart';
import './login_screen_presenter.dart';

class LoginScreen extends StatelessWidget implements LoginScreenContract{
  
  LoginScreen();
   BuildContext _ctx;
  
  //LoginScreenPresenter _presenter;  
  static final TextEditingController _username = new TextEditingController();
  static final TextEditingController _password = new TextEditingController();

  String get username => _username.text;
  String get password => _password.text;

  void onSubmit(){
    print('zas! zas! zas! zas! zas! zas! zas! zas!');
    LoginScreenPresenter _presenter = new LoginScreenPresenter(this);
    _presenter.doLogin(username, password);
  }

  void onLoginSuccess(String token){
    print(token);
     Navigator.pushNamed(_ctx, '/clients');
  }
  void onLoginError(String errorTxt){
    print(errorTxt);
  }

  @override
  Widget build(BuildContext context){
    _ctx = context;
    return Scaffold(
      body: 
        new Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: new Column(children: <Widget>[
            new TextField(controller: _username, decoration: new InputDecoration(hintText: 'Enter a username'),),
            new TextField(controller: _password, decoration: new InputDecoration(hintText: 'Enter a password'),),
            new RaisedButton(
              child: new Text("Iniciar sesion"),
              onPressed: (){this.onSubmit();},
            )
          ],        
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          )
        )
    );     
  }
}
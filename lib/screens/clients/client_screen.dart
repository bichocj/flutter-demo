import 'package:flutter/material.dart';
import './client_screen_presenter.dart';

class ClientScreen extends StatefulWidget {
  ClientScreen();
  
  @override
  _ClientScreenState createState() => new _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> implements ClientScreenContract  {
  ClientScreenPresenter _presenter;

  _ClientScreenState(){
    _presenter = ClientScreenPresenter(this);
    _presenter.requestClients();
  }

  void onClientSuccess(dynamic clients){
    print(clients);
  }
  
  void onClientError(String errorTxt){

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Lista de clientes"),
        actions: <Widget>[
          new IconButton(
            icon:Icon(Icons.exit_to_app),
            onPressed: (){
              print("salir de sesion");
            },
            tooltip: "Salir",
          )
        ],
      ),
      body: Text("Lista de clientes")      
    );
  }
}

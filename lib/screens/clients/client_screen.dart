import 'package:flutter/material.dart';

class ClientScreen extends StatefulWidget {
  ClientScreen();
  
  @override
  _ClientScreenState createState() => new _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  _ClientScreenState();

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

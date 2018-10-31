import 'package:flutter/material.dart';
import './client_screen_presenter.dart';
import 'package:flutter_demo/models/Client.dart';

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


  List<Client> _list;

  @override
  void initState() {
    super.initState();
    _list = [];   
  }


  void onClientSuccess(dynamic clients){
    print(clients);
     setState(() {
      _list = clients;      
    });
  }
  
  void onClientError(String errorTxt){

  }

  List<ChildItem> _buildList() {
    return _list
        .map((contact) => new ChildItem(contact))
        .toList();
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
      body: ListView(
         padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: _buildList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {          
          this._presenter.requestClients();          
        },        
        child: new Icon(
          Icons.refresh,
          semanticLabel: 'Refresh',
        )
      ),
    );
  }
}


class ChildItem extends StatelessWidget {
  final Client _client; 
  const ChildItem(this._client);
  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Text('${this._client.lastname}, ${this._client.name}'),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {
          print(this._client.name);
          /*Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (BuildContext context) => new ClientDetail(clientId: '${this._client.id}')
              )
            );
          */
        }
      );
  }
}
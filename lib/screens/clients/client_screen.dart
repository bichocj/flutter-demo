import 'package:flutter/material.dart';
import './client_screen_presenter.dart';
import 'package:flutter_demo/models/Client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientScreen extends StatefulWidget {
  ClientScreen();
  
  @override
  _ClientScreenState createState() => new _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> implements ClientScreenContract  {
  ClientScreenPresenter _presenter;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
	SharedPreferences _sharedPreferences;


  _ClientScreenState(){
    _presenter = ClientScreenPresenter(this);
    _requestClients();
  }

  _requestClients() async{    
    if(_sharedPreferences == null){
      _sharedPreferences = await _prefs;
    }
    String authToken = _sharedPreferences.getString("token");
    _presenter.requestClients(authToken);    
  }


  List<Client> _list;
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _list = [];   
    _isLoading = true;
  }


  void onClientSuccess(List<Client> clients){
    print(clients);
    setState(() {
      _isLoading = false;
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
        children: _isLoading ? <Widget>[
          Center(
            child: SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator()
              )
          ),          
        ] : _buildList(),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {          
          setState(() {      
            _isLoading = true;   
          });
          _requestClients();
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